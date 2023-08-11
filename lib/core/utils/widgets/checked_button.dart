import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_color.dart';

class CheckedButton extends StatefulWidget {
  bool isCheck;
  String title;

  CheckedButton({Key? key, required this.isCheck, required this.title})
      : super(key: key);

  @override
  State<CheckedButton> createState() => _CheckedButtonState();
}

class _CheckedButtonState extends State<CheckedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: widget.isCheck ? CustomColor.white : Colors.transparent,
          border: Border.all(width: 1, color: CustomColor.white),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.isCheck
              ? const Icon(
                  Icons.done,
                  size: 15,
                  color: CustomColor.blue,
                )
              : const SizedBox(
                  width: 15,
                  height: 15,
                ),
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 14,
                color:
                    widget.isCheck ? CustomColor.blue : CustomColor.white),
          ),
          const SizedBox(
            width: 15,
            height: 15,
          )
        ],
      ),
    );
  }
}
