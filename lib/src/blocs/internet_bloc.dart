import 'dart:async';

import 'package:bloc_test/src/blocs/internet_event.dart';
import 'package:bloc_test/src/blocs/internet_state.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetOnEvent>((event, emit) => emit(InternetOnState()));
    _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        add(InternetOnEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
