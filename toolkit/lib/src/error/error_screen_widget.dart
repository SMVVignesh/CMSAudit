import 'dart:io';

import 'package:flutter/material.dart';

import '../api/api_exception.dart';

class ErrorScreenWidget extends StatelessWidget {
  final ErrorModel errorModel;
  final ErrorTryAgainClick? click;
  final ERROR_WIDGET_SIZE? errorWidgetSize;
  Color color_blue = Color(0xFF302EA7);

  static getWidget(Exception? e, ErrorTryAgainClick click,{Color color = const Color(0xFF302EA7)}) {
    return ErrorScreenWidget(errorModel: getErrorData(e), click: click,color_blue: color,);
  }

  static getWidgetBySize(Exception? e, ErrorTryAgainClick click,
      ERROR_WIDGET_SIZE errorWidgetSize,{Color color = const Color(0xFF302EA7)}) {
    return ErrorScreenWidget(
        errorModel: getErrorData(e),
        click: click,
        errorWidgetSize: errorWidgetSize,color_blue: color);
  }

  static ErrorModel getErrorData(Exception? e) {
    if (e is NoInternetException) {
      return ErrorModel(
          "No Internet", "Check your connection and try again", "TRY AGAIN");
    } else if (e is SocketException) {
      return ErrorModel(
          "Something went wrong", "Please try again", "TRY AGAIN");
    } else if (e is TimeOutException) {
      return ErrorModel("Time out", "Please try again", "TRY AGAIN");
    } else if (e is ApiException) {
      return ErrorModel(
          "Something went wrong", e.getErrorMessage(), "TRY AGAIN");
    } else {
      return ErrorModel("Something went wrong",
          "The request could not be processed.", "TRY AGAIN");
    }
  }

  ErrorScreenWidget(
      {Key? key,
      required this.errorModel,
      this.click,
      this.color_blue = const Color(0xFF302EA7),
      this.errorWidgetSize = ERROR_WIDGET_SIZE.LARGE})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              errorModel.heading ?? "Something went wrong",
              style: TextStyle(
                  fontSize: getHeadingTextSize(),
                  fontWeight: FontWeight.w700,
                  color: color_blue,
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: getGapsSize(errorWidgetSize),
            ),
            Text(
              errorModel.description ?? "Please try after sometime",
              style: TextStyle(
                  fontSize: getDescriptionTextSize(),
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: getGapsSize(errorWidgetSize),
            ),
            TextButton(
              onPressed: () {
                click!();
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                    color: color_blue),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 30, right: 30),
                  child: Text(errorModel.buttonName ?? "TRY AGAIN",
                      style: TextStyle(
                          fontSize: getSubHeadingTextSize(),
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          decoration: TextDecoration.none)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  double getGapsSize(ERROR_WIDGET_SIZE? errorWidgetSize) {
    switch (errorWidgetSize) {
      case ERROR_WIDGET_SIZE.SMALL:
        return 10;
      case ERROR_WIDGET_SIZE.MEDIUM:
        return 20;
      default:
        return 30;
    }
  }

  double getImageWidth() {
    switch (errorWidgetSize) {
      case ERROR_WIDGET_SIZE.SMALL:
        return 140;
      case ERROR_WIDGET_SIZE.MEDIUM:
        return 240;
      default:
        return 340;
    }
  }

  double getImageHeight() {
    switch (errorWidgetSize) {
      case ERROR_WIDGET_SIZE.SMALL:
        return 40;
      case ERROR_WIDGET_SIZE.MEDIUM:
        return 140;
      default:
        return 240;
    }
  }

  double getHeadingTextSize() {
    switch (errorWidgetSize) {
      case ERROR_WIDGET_SIZE.SMALL:
        return 16;
      case ERROR_WIDGET_SIZE.MEDIUM:
        return 24;
      default:
        return 32;
    }
  }

  double getSubHeadingTextSize() {
    switch (errorWidgetSize) {
      case ERROR_WIDGET_SIZE.SMALL:
        return 12;
      case ERROR_WIDGET_SIZE.MEDIUM:
        return 16;
      default:
        return 18;
    }
  }

  double getDescriptionTextSize() {
    switch (errorWidgetSize) {
      case ERROR_WIDGET_SIZE.SMALL:
        return 10;
      case ERROR_WIDGET_SIZE.MEDIUM:
        return 12;
      default:
        return 14;
    }
  }
}

class ErrorModel {
  String? heading;
  String? description;
  String? buttonName;

  ErrorModel(this.heading, this.description, this.buttonName);
}

typedef ErrorTryAgainClick = void Function();

enum ERROR_WIDGET_SIZE { SMALL, MEDIUM, LARGE }
