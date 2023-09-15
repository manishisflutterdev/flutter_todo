import 'package:ekkagata/Source/Modules/Home/screens/todo_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'screens/homepage_screen.dart';

class HomeModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => Homepage(),
    ),
    ChildRoute(
      '/todo',
      child: (context, args) => TodoScreen(),
    ),
  ];
}
