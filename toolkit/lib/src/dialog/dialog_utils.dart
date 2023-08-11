import 'package:flutter/material.dart';

class DialogUtils {
  static void showCustomDialog(
      {required BuildContext context,
      required Color themeColor,
      String? heading,
      String? desc,
      String? positiveBtn,
      String? negativeBtn,
      Function()? positiveClick,
      Function()? negativeClick,
      bool willPop = true}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return willPop;
            },
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 25, bottom: 25, left: 13, right: 13),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        heading ?? "",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        desc ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      (positiveBtn == null)
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: positiveClick,
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: themeColor,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(positiveBtn ?? "",
                                        style: const TextStyle(
                                            backgroundColor: Colors.transparent,
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: (negativeBtn == null) ? 0 : 10,
                      ),
                      (negativeBtn == null)
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: negativeClick,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  negativeBtn ?? "",
                                  style: TextStyle(color: themeColor),
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
