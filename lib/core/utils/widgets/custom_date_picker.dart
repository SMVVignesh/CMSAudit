import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tool_kit/tool_kit.dart';

import '../custom_color.dart';

class CustomDatePicker extends StatefulWidget {
  Function(DateTime? selectedValue) onDateChange;
   CustomDatePicker({super.key,required this.onDateChange});

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Select Date",style: TextStyle(fontSize: 14,color: CustomColor.toolbarBg,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              SizedBox(
                height: 180,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  dateOrder: DatePickerDateOrder.dmy,
                  onDateTimeChanged: (DateTime value) {
                    selectedValue = value;
                  },
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: CustomColor.grey,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Cancel",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 14, color: CustomColor.black),
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      widget.onDateChange(selectedValue);
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: CustomColor.toolbarBg,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Save",
                          style: TextStyle(
                              fontSize: 14, color: CustomColor.white),
                        ),
                      ),
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
