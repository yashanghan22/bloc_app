import 'package:bloc_app/sign_in/bloc/sigin_state.dart';
import 'package:bloc_app/sign_in/bloc/signin_bloc.dart';
import 'package:bloc_app/sign_in/bloc/signin_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign in With email'),
        ),
        body: Container(
          // color: Colors.amber,
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state is SignInErrorState) {
                      return Text(
                        state.errormessage,
                        style: const TextStyle(color: Colors.red),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: emailcontroller,
                  onChanged: (value) {
                    BlocProvider.of<SignInBloc>(context).add(
                        SignInTextChangedEvent(
                            emailcontroller.text, passwordcontroller.text));
                  },
                  decoration: InputDecoration(hintText: 'Email Address'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordcontroller,
                  onChanged: (value) {
                    BlocProvider.of<SignInBloc>(context).add(
                        SignInTextChangedEvent(
                            emailcontroller.text, passwordcontroller.text));
                  },
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state is SignInLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return CupertinoButton(
                      color: (state is SignInValidState)
                          ? Colors.blue
                          : Colors.grey,
                      onPressed: () {
                        if (state is SignInValidState) {
                          BlocProvider.of<SignInBloc>(context).add(
                              SignIntextSubmittedEvent(emailcontroller.text,
                                  passwordcontroller.text));
                        }
                      },
                      child: const Text('Sign in'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
