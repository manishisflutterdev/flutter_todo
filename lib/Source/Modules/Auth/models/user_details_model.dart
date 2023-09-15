import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable

userDetailsModelFromJson(String str) {
  var decoded = jsonDecode(str);
  return UserDetailsModel(
      email: decoded['data']['email'],
      userId: decoded['data']['_id'],
      token: decoded['token']);
}

class UserDetailsModel extends Equatable {
  String? email, userId, token;

  UserDetailsModel({this.email, this.userId, this.token});

  List<Object?> get props => [email, userId, token];
}
