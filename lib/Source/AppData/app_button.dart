import 'package:flutter/material.dart';
import '../CommonWidgets/app_text_widget.dart';
import 'app_color.dart';
import 'device_size.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final Color borderColor;
  final double borderSize;
  final onTap;
  final icon;
  final centerIcon;
  AppButton(
      {required this.text,
      this.onTap,
      this.centerIcon = false,
      this.icon,
      this.textColor = Colors.black,
      this.buttonColor = AppColor.primary,
      this.borderColor = AppColor.transparent,
      this.borderSize = 1});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: DeviceDimention.deviceWidth,
        height: 50,
        decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(color: borderColor, width: borderSize),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Row(
            mainAxisAlignment: centerIcon
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
              AppText(
                text,
                size: 14,
                bold: true,
                color: textColor,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: (icon != null) ? icon : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
