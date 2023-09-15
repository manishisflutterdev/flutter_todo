import '/Source/Modules/Auth/screens/signin_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'screens/splash_screen.dart';

class AuthModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => SplashScreen(),
    ),
    ChildRoute(
      '/signin',
      child: (context, args) => SigninScreen(),
    ),
  ];
}
