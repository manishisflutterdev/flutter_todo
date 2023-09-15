import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../AppData/app_button.dart';
import '../../../CommonWidgets/app_text_widget.dart';
import '../../Auth/cubit/auth_cubit.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Image.asset('assets/images/app-brand.jpeg')),
          AppText(
            "User Email",
            size: 20,
            bold: true,
            color: Colors.black,
          ),
          SizedBox(
            height: 15,
          ),
          AppText(
            Modular.get<AuthCubit>().state.userDetailsModel?.email ?? '',
            size: 16,
            color: Colors.black,
          ),
          Expanded(child: SizedBox()),
          AppButton(
            text: "Logout",
            textColor: Colors.white,
            onTap: () {
              Modular.get<AuthCubit>().clearState();
              Modular.to.navigate('/signin');
            },
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
