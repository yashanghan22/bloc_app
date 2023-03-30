import 'dart:developer';

import 'package:bloc_app/internet/internet_bloc/internet_bloc.dart';
import 'package:bloc_app/internet/internet_bloc/internet_state.dart';
import 'package:bloc_app/internet/internet_cubit/internet_cubit.dart';
import 'package:bloc_app/sign_in/bloc/sigin_state.dart';
import 'package:bloc_app/sign_in/bloc/signin_bloc.dart';
import 'package:bloc_app/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final SignInState siginst1 = SignInErrorState('Error');
  final SignInState siginst2 = SignInErrorState('Error');
  log('${siginst1 == siginst2}');
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
