import 'package:ekkagata/Source/AppData/app_color.dart';
import 'package:ekkagata/Source/AppData/device_size.dart';
import 'package:ekkagata/Source/CommonWidgets/app_text_widget.dart';
import 'package:ekkagata/Source/Modules/Home/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  DateTime? selectedDate = DateTime.now();
  List data = [];
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    fetchTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: AppText(
          "Your Todos",
          size: 16,
          bold: true,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          dateRow(),
          loading
              ? Expanded(
                  child: Center(
                  child: CircularProgressIndicator(),
                ))
              : Expanded(
                  child: (data.length == 0)
                      ? Container(
                          margin: EdgeInsets.all(20),
                          child: Center(
                            child: AppText(
                              "You dont have any TODO for this date",
                              size: 25,
                              color: AppColor.secondary,
                              bold: true,
                            ),
                          ),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return cont(
                              data[index]['todo'],
                            );
                          }),
                )
        ],
      ),
    );
  }

  Widget cont(String todo) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: DeviceDimention.deviceWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.primary.withOpacity(0.5)),
        child: Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                Flexible(
                  child: AppText(
                    todo,
                    color: AppColor.secondary,
                    size: 16,
                    bold: true,
                  ),
                ),
              ],
            )));
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
        fetchTodo();
      });
    }
  }

  fetchTodo() async {
    loading = true;
    var response = await HomeRepository.getTodoByDate(
        DateFormat('yyyy-MM-dd').format(selectedDate!));
    if (response['success'] == true) {
      setState(() {
        data = response['data'];
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
    }
  }
}
