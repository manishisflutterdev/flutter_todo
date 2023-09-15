part of 'connectivity_cubit.dart';

enum ConnectivityEnum { online, offline }

class ConnectivityState {
  ConnectivityEnum? connectivity;

  ConnectivityState({this.connectivity});
}
