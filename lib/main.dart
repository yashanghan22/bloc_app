import 'dart:developer';

import 'package:bloc_app/bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_app/bloc/internet_bloc/internet_state.dart';
import 'package:bloc_app/counter_bloc.dart';
import 'package:bloc_app/counter_event.dart';
import 'package:bloc_app/cubit/internet_cubit.dart';
import 'package:bloc_app/sign_in/bloc/signin_bloc.dart';
import 'package:bloc_app/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignInScreen(),
      ),
    );
  }
}

class CubitDemo extends StatelessWidget {
  const CubitDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocConsumer<InternetCubit, InternetcState>(
          builder: (context, state) {
            if (state == InternetcState.Gained) {
              return const Text('Connected');
            } else if (state == InternetcState.Lost) {
              return const Text('Disconnected');
            } else {
              return const Text('Loading...');
            }
          },
          listener: (context, state) {
            if (state == InternetcState.Gained) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Internet Connected!'),
                backgroundColor: Colors.amber,
              ));
            } else if (state == InternetcState.Lost) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Internet Not Connected!'),
                backgroundColor: Colors.red,
              ));
            }
          },
        ),
      ),
    ));
  }
}

class BlocHome extends StatelessWidget {
  const BlocHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
            builder: (context, state) {
              if (state is InternetGainedState) {
                return const Text('Connected');
              } else if (state is InternetLostState) {
                return const Text('Disconnected');
              } else {
                return const Text('Loading...');
              }
            },
            listener: (context, state) {
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Internet Connected!'),
                  backgroundColor: Colors.amber,
                ));
              } else if (state is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Internet Not Connected!'),
                  backgroundColor: Colors.red,
                ));
              }
            },
          ),
          //     BlocBuilder<InternetBloc, InternetState>(builder: (context, state) {
          //   if (state is InternetGainedState) {
          //     return const Text('Connected');
          //   } else if (state is InternetLostState) {
          //     return const Text('Disconnected');
          //   } else {
          //     return const Text('Loading...');
          //   }
          // }),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          child: StreamBuilder(
        stream: _bloc.counter,
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${snapshot.data}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          );
        },
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
