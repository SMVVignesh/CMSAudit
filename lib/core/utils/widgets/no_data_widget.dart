import 'package:flutter/material.dart';

class NoDataWidget extends StatefulWidget {
  String message;
  Color borderColor;
  String? icon;

  NoDataWidget({Key? key, required this.message, required this.borderColor,this.icon})
      : super(key: key);

  @override
  State<NoDataWidget> createState() => _NoDataWidgetState();
}

class _NoDataWidgetState extends State<NoDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: widget.borderColor),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(widget.icon??"",width: 20,height: 20,),
            Text(widget.message),
          ],
        ),
      ),
    );
  }
}
