import 'package:equatable/equatable.dart';

import '/Source/Modules/Auth/models/user_details_model.dart';

enum AuthStatus {
  authorized,
  loading,
  unauthorized,
}

enum Loading { loading, notLoading }

class AuthCubitState extends Equatable {
  final AuthStatus authStatus;
  final Loading? loading;
  final UserDetailsModel? userDetailsModel;

  AuthCubitState(
      {required this.authStatus, this.userDetailsModel, this.loading});

  AuthCubitState.init(
      {required this.authStatus, this.userDetailsModel, this.loading});

  @override
  List<Object?> get props => [authStatus, userDetailsModel, this.loading];
}
