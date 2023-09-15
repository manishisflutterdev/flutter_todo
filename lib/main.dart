import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'ModuleData/app_module.dart';
import 'ModuleData/app_widget.dart';

void main() async {
  try {
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      final appDir = await getApplicationSupportDirectory();
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: await appDir.create(recursive: true),
      );
      runApp(ModularApp(module: AppModule(), child: AppWidget()));
    }, (error, stack) {
      print("Error $error   of stack : $stack");
    });
  } catch (e) {
    print("Global Error $e");
  }
}
