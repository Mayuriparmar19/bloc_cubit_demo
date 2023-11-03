import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum InternetState { initial, lost, gained }

class InternetCubit extends Cubit<InternetState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetState.initial) {
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetState.gained);
      } else {
        emit(InternetState.lost);
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
//if your state have nothing is the classes then you can declare them as a enum.
// you can use enum only and only when you have empty classes.
// in enum you just have to declare each  possible situation as a states so your cubit function can emit that states
