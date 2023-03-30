import 'dart:developer';

import 'package:bloc_app/counter/counter_bloc.dart';
import 'package:bloc_app/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  final _bloc = CounterBloc();

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('build');
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, int>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Text(
                      '$state',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }),
              const SizedBox(height: 80),
              MaterialButton(
                color: Colors.green,
                child: const Text('Go to Second Screen'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/second-screen');
                },
              ),
              const SizedBox(height: 80),
              MaterialButton(
                color: Colors.amber,
                child: const Text('Go to third Screen'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/third-screen');
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'btn1',
              onPressed: () =>
                  BlocProvider.of<CounterCubit>(context).increment(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              heroTag: 'btn2',
              onPressed: () {
                // BlocProvider.of<CounterCubit>(context).decrement();
                context.read<CounterCubit>().decrement();
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
