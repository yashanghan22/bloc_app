import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_cubit.dart';

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
