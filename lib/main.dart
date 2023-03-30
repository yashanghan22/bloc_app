import 'package:bloc_app/logic/presentation/router/app_route.dart';
import 'package:bloc_app/logic/utility/app_bloc_observer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'logic/cubit/counter_cubit.dart';

class Myclass extends Equatable {
  final int value;
  Myclass({required this.value});

  @override
  List<Object?> get props => [value];

  // @override
  // bool operator ==(Object o) {
  //   if (identical(this, o)) return true;

  //   return o is Myclass && o.value == value;
  // }

  // @override
  // int get hashcode => value.hashCode;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  Bloc.observer = AppBlocObserver();
  // final a = Myclass(value: 1);
  // final b = Myclass(value: 2);
  // print(a == b);
  // print(a == a);
  // print(b == b);
  // final SignInState siginst1 = SignInErrorState('Error');
  // final SignInState siginst2 = SignInErrorState('Error');
  // log('${siginst1 == siginst2}');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _cubit = CounterCubit();
  final AppRouter _approuter = AppRouter();
  @override
  void dispose() {
    _cubit.close();
    // _approuter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      lazy: false,
      child: MaterialApp(
        onGenerateRoute: _approuter.onGenerateroute,
        // routes: {
        //   '/': (context) => BlocProvider.value(
        //       value: _cubit, child: const HomeScreen(title: 'Home page')),
        //   '/second-screen': (context) => BlocProvider.value(
        //       value: _cubit,
        //       child: const SecondScreen(
        //           title: 'second page', color: Colors.green)),
        //   '/third-Screen': (context) => BlocProvider.value(
        //         value: _cubit,
        //         child: const ThirdScreen(
        //           title: 'Third page',
        //           color: Colors.amber,
        //         ),
        //       ),
        // },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //   home: const HomeScreen(title: 'Home Page'),
      ),
    );
  }
}
