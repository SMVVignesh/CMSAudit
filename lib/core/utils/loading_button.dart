import 'package:flutter/material.dart';

import 'custom_color.dart';

/*
* This is custom Loading button for login Page*/
class LoadingButton extends StatefulWidget {
  late bool isLoading;
  late String btnName;
  late Function callback;

  LoadingButton(
      {Key? key,
      required this.btnName,
      required this.isLoading,
      required this.callback})
      : super(key: key);

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.isLoading) {
          widget.callback();
        }
      },
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.transparent,
          border: Border.all(width: 1, color: CustomColor.grey),
        ),
        child: Center(
          child: widget.isLoading
              ? Image.asset(
                  "assets/image/loading.gif",
                  height: 35,
                )
              : Text(widget.btnName ?? "",
                  style: const TextStyle(
                      backgroundColor: Colors.transparent,
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
