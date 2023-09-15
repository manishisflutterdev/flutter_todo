import 'dart:convert';
import 'package:ekkagata/Source/Utilities/Methods/common_methods.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import '../../Auth/cubit/auth_cubit.dart';

class HomeRepository {
  static postTodo(var data) async {
    final response = await http.post(
        Uri.parse('https://todos-app-5oyz.onrender.com/todos/save'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${Modular.get<AuthCubit>().state.userDetailsModel?.token}'
        });
    if (response.statusCode == 200) {
      CommonMethods.toast("Successfully Added todo to the List");
      return true;
    } else {
      CommonMethods.toast("Failed Adding your Todo", error: true);
      return false;
    }
  }

  static getTodoByDate(String date) async {
    String url =
        'https://todos-app-5oyz.onrender.com/todos/getTodosByDate/${Modular.get<AuthCubit>().state.userDetailsModel?.userId}/$date';
    print(url);
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${Modular.get<AuthCubit>().state.userDetailsModel?.token}'
    });
    print(response.body);
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      return {"success": true, "data": decoded['data']};
    } else {
      CommonMethods.toast("Failed Adding your Todo", error: true);
      return {"success": false};
    }
  }
}





// http://localhost:5000/todos/save