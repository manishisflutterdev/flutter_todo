import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_connectivity.dart';

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Adventure Carz",
      theme: ThemeData(useMaterial3: false, fontFamily: 'Poppins'),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      builder: (context, child) {
        return SafeArea(
          child: AppConnectivity(
            child: child,
          ),
        );
      },
    );
  }
}
