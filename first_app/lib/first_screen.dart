import 'package:first_app/social_buttons.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.menu,
          color: Colors.deepOrange,
        ),
        centerTitle: true,
        title: Text(
          "My First App",
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.deepOrange,
              )),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset("assets/images/images.jpeg"),
              ClipOval(
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHKMUyUU3OEve8kZRg_XlYuZZFzwNoB79pSg&s",
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(20),
              //   child: Image.network(
              //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHKMUyUU3OEve8kZRg_XlYuZZFzwNoB79pSg&s",
              //     width: 200,
              //     height: 200,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Ahmed Ali",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Flutter Developer",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              SocialButtons(),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 60,
                padding: EdgeInsets.all(10),
                // margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: .3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'omar.mar7@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
