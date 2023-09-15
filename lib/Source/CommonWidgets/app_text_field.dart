import 'package:flutter/material.dart';

import '../AppData/app_color.dart';
import '../AppData/device_size.dart';
import 'app_text_widget.dart';

class AppTextField extends StatelessWidget {
  final String headingText;
  final TextEditingController controller;
  final bool numeric;
  AppTextField(
      {required this.headingText,
      required this.controller,
      this.numeric = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              AppText(
                headingText,
                size: 11,
                bold: true,
                color: AppColor.secondary,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: DeviceDimention.deviceWidth,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: TextField(
                controller: controller,
                keyboardType:
                    numeric ? TextInputType.number : TextInputType.text,
                cursorColor: AppColor.primary,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
