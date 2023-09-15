import 'package:ekkagata/Source/Modules/Auth/cubit/auth_cubit.dart';
import 'package:ekkagata/Source/Modules/Auth/models/auth_cubit_state.dart';
import 'package:ekkagata/Source/Utilities/Methods/common_methods.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../AppData/app_button.dart';
import '../../../AppData/device_size.dart';
import '../../../CommonWidgets/app_text_field.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController _emailContrtoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Container(
                margin: EdgeInsets.only(top: 40, left: 40, right: 40),
                width: DeviceDimention.deviceWidth / 2,
                child: Image.asset('assets/images/app-brand.jpeg')),
          ),
          Expanded(
              child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      AppTextField(
                        headingText: "Enter your Email",
                        controller: _emailContrtoller,
                      ),
                      BlocBuilder<AuthCubit, AuthCubitState>(
                        bloc: Modular.get<AuthCubit>(),
                        builder: (context, state) {
                          return Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).padding.top),
                            child: Column(
                              children: [
                                state.loading == Loading.loading
                                    ? Container(
                                        margin: EdgeInsets.all(20),
                                        height: 75,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                    : AppButton(
                                        onTap: () {
                                          if (_emailContrtoller.text
                                                  .contains("@") &&
                                              _emailContrtoller.text
                                                  .contains(".")) {
                                            buttonCall();
                                          } else {
                                            CommonMethods.toast(
                                                "Enter a valid email",
                                                error: true);
                                          }
                                        },
                                        text: "Signin",
                                        textColor: Colors.white,
                                      ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  buttonCall() async {
    Map data = {"email": _emailContrtoller.text};
    Modular.get<AuthCubit>().auth(data);
  }

  // Container(
  //       margin: EdgeInsets.all(20),
  //       height: 75,
  //       child: Center(
  //         child: CircularProgressIndicator(),
  //       ),
  //     )
}
