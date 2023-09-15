import 'package:ekkagata/Source/Modules/Auth/cubit/auth_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '/Source/Modules/Home/cubit/home_cubit.dart';
import '/Source/Utilities/Connectivity/connectivity_cubit.dart';
import '../Source/Modules/Auth/auth_module.dart';
import '../Source/Modules/Home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<ConnectivityCubit>(
          (injector) => ConnectivityCubit(),
          onDispose: (instance) => instance.close(),
        ),
        Bind.singleton<HomeCubit>(
          (injector) => HomeCubit(),
          onDispose: (instance) => instance.close(),
        ),
        Bind.singleton<AuthCubit>(
          (injector) => AuthCubit(),
          onDispose: (instance) => instance.close(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/',
            module: AuthModule(),
            transition: TransitionType.rightToLeft,
            duration: Duration(milliseconds: 500)),
        ModuleRoute('/home',
            module: HomeModule(),
            transition: TransitionType.rightToLeft,
            duration: Duration(milliseconds: 500)),
      ];
}
