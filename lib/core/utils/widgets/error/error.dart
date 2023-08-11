import 'package:flutter/material.dart';

enum MessageStatus {
  success,
  error,
}

class ErrorInfoWidget extends StatefulWidget {
  MessageStatus status;
  String message;
  String? reloadText;

  Function()? reload;

  ErrorInfoWidget(
      {Key? key,
      required this.message,
      required this.status,
      this.reloadText,
      this.reload})
      : super(key: key);

  @override
  State<ErrorInfoWidget> createState() => _ErrorInfoWidgetState();
}

class _ErrorInfoWidgetState extends State<ErrorInfoWidget> {
  Color _getColorFromStatus() {
    switch (widget.status) {
      case MessageStatus.success:
        return Colors.green;
      case MessageStatus.error:
        return Colors.red;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: _getColorFromStatus())),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: _getColorFromStatus(),
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              widget.message,
              style: TextStyle(color: Colors.white),
            ),
            Expanded(child: SizedBox()),
            (widget.reloadText != null)
                ? GestureDetector(
                    onTap: widget.reload,
                    child: Text(widget.reloadText ?? "",
                        style: TextStyle(color: Colors.white)),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
