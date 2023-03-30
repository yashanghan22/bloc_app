import 'package:bloc_app/logic/cubit/counter_cubit.dart';
import 'package:bloc_app/logic/presentation/screens/counter_home_screen.dart';
import 'package:bloc_app/logic/presentation/screens/counter_second_screen.dart';
import 'package:bloc_app/logic/presentation/screens/counter_third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  // final CounterCubit _cubit = CounterCubit();
  Route? onGenerateroute(RouteSettings routsettings) {
    switch (routsettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen(title: 'Home Screen');
          },
        );
      case '/second-screen':
        return MaterialPageRoute(
          builder: (context) {
            return SecondScreen(
              title: 'second Screen',
              color: Colors.green,
            );
          },
        );
      case '/third-screen':
        return MaterialPageRoute(
          builder: (context) {
            return ThirdScreen(
              title: 'third Screen',
              color: Colors.amber,
            );
          },
        );
      default:
        return null;
    }
    // switch (routsettings.name) {
    //   case '/':
    //     return MaterialPageRoute(
    //       builder: (context) {
    //         return BlocProvider.value(
    //             value: _cubit, child: HomeScreen(title: 'Home Screen'));
    //       },
    //     );
    //   case '/second-screen':
    //     return MaterialPageRoute(
    //       builder: (context) {
    //         return BlocProvider.value(
    //             value: _cubit,
    //             child: SecondScreen(
    //               title: 'second Screen',
    //               color: Colors.green,
    //             ));
    //       },
    //     );
    //   case '/third-screen':
    //     return MaterialPageRoute(
    //       builder: (context) {
    //         return BlocProvider.value(
    //             value: _cubit,
    //             child: ThirdScreen(
    //               title: 'third Screen',
    //               color: Colors.amber,
    //             ));
    //       },
    //     );
    //   default:
    //     return null;
    // }
  }

  // void dispose() {
  //   _cubit.close();
  // }
}
