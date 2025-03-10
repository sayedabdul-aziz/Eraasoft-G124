import 'package:counter_with_bloc/bloc/counter_bloc.dart';
import 'package:counter_with_bloc/bloc/counter_event.dart';
import 'package:counter_with_bloc/cubit/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        body: BlocBuilder<CounterBloc, CounterStates>(
          builder: (context, state) {
            var bloc = context.read<CounterBloc>();
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bloc.counter.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton.filled(
                        onPressed: () {
                          // cubit.minus();
                          bloc.add(MinusCounterEvent());
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      IconButton.filled(
                        onPressed: () {
                          // cubit.add();
                          bloc.add(AddCounterEvent());
                        },
                        icon: const Icon(Icons.add),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
