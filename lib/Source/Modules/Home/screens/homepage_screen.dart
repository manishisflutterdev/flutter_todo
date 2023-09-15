import 'package:ekkagata/Source/AppData/app_button.dart';
import 'package:ekkagata/Source/AppData/app_color.dart';
import 'package:ekkagata/Source/AppData/device_size.dart';
import 'package:ekkagata/Source/CommonWidgets/app_text_widget.dart';
import 'package:ekkagata/Source/Modules/Auth/cubit/auth_cubit.dart';
import 'package:ekkagata/Source/Modules/Home/repository/home_repository.dart';
import 'package:ekkagata/Source/Modules/Home/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DateTime? selectedDate = DateTime.now();
  TextEditingController _todo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: AppText(
          "Todo App",
          color: Colors.white,
          bold: true,
          size: 16,
        ),
      ),
      drawer: HomeDrawer(),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          AppText(
            "Create your Todo",
            size: 28,
            bold: true,
          ),
          dateRow(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: DeviceDimention.deviceWidth,
            height: 150,
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primary),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: _todo,
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          AppButton(
            onTap: () {
              submit();
            },
            text: "Submit",
            textColor: Colors.white,
          ),
          SizedBox(
            height: 20,
          ),
          AppButton(
            onTap: () {
              Modular.to.pushNamed('/home/todo');
            },
            buttonColor: AppColor.secondary,
            icon: Icon(
              Icons.visibility,
              color: Colors.white,
            ),
            centerIcon: true,
            text: "View your Todo",
            textColor: Colors.white,
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget dateRow() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primary),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: AppText(
              DateFormat('yyyy-MM-dd').format(selectedDate!),
              bold: true,
            )),
          )),
          GestureDetector(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.primary),
              child: Center(
                child: Icon(
                  Icons.date_range,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate!,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  submit() async {
    var data = {
      "userId": Modular.get<AuthCubit>().state.userDetailsModel?.userId,
      "todo": _todo.text,
      "date": DateFormat('yyyy-MM-dd').format(selectedDate!)
    };
    print(data);
    var response = await HomeRepository.postTodo(data);
    if (response == true) {
      selectedDate = DateTime.now();
      _todo.clear();
    }
  }
}
