import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit()
      : super(ConnectivityState(connectivity: ConnectivityEnum.online));

  @override
  close() async {
    await _connectivitySubscription.cancel();
  }

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  void updateConnectionStatus(ConnectivityResult connectivityResult) {
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        emit(ConnectivityState(connectivity: ConnectivityEnum.online));
        break;
      case ConnectivityResult.none:
        emit(ConnectivityState(connectivity: ConnectivityEnum.offline));
        break;
      default:
        break;
    }
  }

  Future<void> initConnectivity() async {
    try {
      final ConnectivityResult connectivityResult =
          await _connectivity.checkConnectivity();
      updateConnectionStatus(connectivityResult);
      _connectivitySubscription = _connectivity.onConnectivityChanged
          .listen((ConnectivityResult connectivityResult) {
        updateConnectionStatus(connectivityResult);
      });
    } catch (e) {
      print('Error: $e');
    }
  }
}
