import 'package:flutter/material.dart';

import '../AppData/device_size.dart';

class AppNavbar extends StatelessWidget {
  final Widget? leftIcon;
  final Widget? rightIcon;
  AppNavbar({this.leftIcon, this.rightIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: DeviceDimention.deviceWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leftIcon == null
              ? Container(
                  margin: EdgeInsets.all(20),
                  width: 40,
                )
              : leftIcon!,
          Container(
              width: DeviceDimention.deviceWidth / 3,
              child: Image.asset('assets/images/app-brand.png')),
          rightIcon == null
              ? Container(
                  margin: EdgeInsets.all(20),
                  width: 40,
                )
              : rightIcon!,
        ],
      ),
    );
  }
}
