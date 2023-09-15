import 'dart:async';
import 'package:ekkagata/Source/Modules/Auth/cubit/auth_cubit.dart';
import 'package:ekkagata/Source/Modules/Auth/models/auth_cubit_state.dart';
import 'package:ekkagata/Source/Modules/Auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../AppData/device_size.dart';
import '../../../Utilities/Connectivity/connectivity_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _navigate() {
    if (Modular.get<AuthCubit>().state.authStatus == AuthStatus.authorized) {
      Modular.get<AuthCubit>().callAuth();
      Timer(Duration(seconds: 4), () {
        Modular.to.navigate('/home/');
        Modular.get<ConnectivityCubit>().initConnectivity();
      });
    } else {
      Timer(Duration(seconds: 4), () {
        Modular.to.navigate('/signin');
        Modular.get<ConnectivityCubit>().initConnectivity();
      });
    }
  }

  wakeup() {
    AuthRepository.wakeup();
  }

  @override
  void initState() {
    super.initState();
    wakeup();
    _navigate();
  }

  setDeviceWidth(double width) {
    DeviceDimention.deviceWidth = width;
  }

  @override
  Widget build(BuildContext context) {
    setDeviceWidth(MediaQuery.of(context).size.width);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                margin: EdgeInsets.all(40),
                child: Image.asset('assets/images/app-brand.jpeg')),
          )
        ],
      ),
    );
  }
}
