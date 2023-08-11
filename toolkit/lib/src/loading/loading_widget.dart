import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  String? message;
  Widget? logo;

  LoadingWidget({Key? key, this.message, this.logo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (logo != null)
                  ? logo!
                  : const SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                        strokeWidth: 3,
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              Text(
                message ?? "",
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ));
  }
}
