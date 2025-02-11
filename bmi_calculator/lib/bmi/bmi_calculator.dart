import 'package:bmi_calculator/bmi/result_screen.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  bool isMale = true;
  double height = 160;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bmi Calculator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        color: isMale ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        color: !isMale ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                ],
              )),
              SizedBox(height: 10),
              Expanded(
                  child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(height.toInt().toString()),
                    Slider(
                      value: height,
                      min: 70,
                      max: 210,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              )),
              SizedBox(height: 10),
              Expanded(
                  child: Container(
                color: Colors.blue,
              )),
              SizedBox(height: 10),
              SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      // w / h*h
                      double result = 210;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              result: result,
                            ),
                          ));
                    },
                    child: Text('Calculate'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
