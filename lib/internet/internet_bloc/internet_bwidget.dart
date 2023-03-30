import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_bloc.dart';
import 'internet_state.dart';

class Internetbloclearn extends StatelessWidget {
  const Internetbloclearn({super.key});

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
