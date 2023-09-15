import 'package:ekkagata/Source/Modules/Auth/repository/auth_repository.dart';
import 'package:ekkagata/Source/Utilities/Cubit_State/cubit_state.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../Utilities/Methods/common_methods.dart';
import '../models/auth_cubit_state.dart';
import '../models/user_details_model.dart';

class AuthCubit extends HydratedCubit<AuthCubitState> {
  AuthCubit()
      : super(AuthCubitState(
          authStatus: AuthStatus.unauthorized,
        ));

  @override
  AuthCubitState? fromJson(Map<String, dynamic> json) {
    return AuthCubitState(
      authStatus: AuthStatus.values[json['authStatus'] as int],
      loading: Loading.values[json['loading'] as int],
      userDetailsModel: UserDetailsModel(
        email: json['email'] as String?,
        userId: json['userId'] as String?,
        token: json['token'] as String?,
      ),
    );
  }

  @override
  Map<String, dynamic>? toJson(AuthCubitState state) {
    return {
      'authStatus': state.authStatus.index,
      'loading': state.authStatus.index,
      'email': state.userDetailsModel?.email,
      'userId': state.userDetailsModel?.userId,
      'token': state.userDetailsModel?.token,
    };
  }

  callAuth() async {
    CubitState response = await AuthRepository.authenticate(
        {"email": state.userDetailsModel?.email});

    if (response.status == CubitStatus.success) {
      emit(AuthCubitState(
          authStatus: AuthStatus.authorized,
          loading: Loading.notLoading,
          userDetailsModel: response.value));
      // Modular.to.navigate('/home/');
    } else {
      CommonMethods.toast(response.error!, error: true);
      emit(AuthCubitState(
        authStatus: AuthStatus.unauthorized,
        loading: Loading.notLoading,
      ));
    }
  }

  auth(var data) async {
    emit(
        AuthCubitState(authStatus: state.authStatus, loading: Loading.loading));
    CubitState response = await AuthRepository.authenticate(data);
    if (response.status == CubitStatus.success) {
      emit(AuthCubitState(
          authStatus: AuthStatus.authorized,
          loading: Loading.notLoading,
          userDetailsModel: response.value));
      Modular.to.navigate('/home/');
    } else {
      CommonMethods.toast(response.error!, error: true);
      emit(AuthCubitState(
          authStatus: AuthStatus.unauthorized, loading: Loading.notLoading));
    }
  }

  clearState() {
    emit(AuthCubitState(authStatus: AuthStatus.unauthorized));
  }
}
