import 'dart:convert';
import 'package:ekkagata/Source/Modules/Auth/models/user_details_model.dart';

import '/Source/Utilities/Cubit_State/cubit_state.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  static authenticate(var data) async {
    final response = await http.post(
        Uri.parse('https://todos-app-5oyz.onrender.com/users/auth'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return CubitState(
          status: CubitStatus.success,
          value: userDetailsModelFromJson(response.body));
    } else {
      return CubitState(
          status: CubitStatus.error, error: "Failed to Fetch Data");
    }
  }

  static wakeup() async {
    await http.get(Uri.parse('https://todos-app-5oyz.onrender.com/'));
  }
}
