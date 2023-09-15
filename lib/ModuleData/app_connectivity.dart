import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../Source/Utilities/Connectivity/connectivity_cubit.dart';

class AppConnectivity extends StatefulWidget {
  final child;

  AppConnectivity({this.child});

  @override
  _AppConnectivityState createState() => _AppConnectivityState();
}

class _AppConnectivityState extends State<AppConnectivity> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      bloc: Modular.get<ConnectivityCubit>(),
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              state.connectivity == ConnectivityEnum.offline
                  ? Expanded(child: offlinePage())
                  : Expanded(child: widget.child)
            ],
          ),
        );
      },
    );
  }
}

Widget offlinePage() {
  return Material(
    child: Container(
      padding: EdgeInsets.all(20),
      color: Colors.black,
      child: Center(
        child: Text(
          "Please connect to Internet",
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

class NetworkErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Container(
        margin: EdgeInsets.all(2),
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "You are not connected to Network",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
