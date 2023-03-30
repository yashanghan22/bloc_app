// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetcState { Initial, Lost, Gained }

class InternetCubit extends Cubit<InternetcState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  InternetCubit() : super(InternetcState.Initial) {
    connectivitySubscription = moniterInternetcubit();
  }

  StreamSubscription<ConnectivityResult> moniterInternetcubit() {
    return _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        emit(InternetcState.Gained);
      } else {
        emit(InternetcState.Lost);
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
