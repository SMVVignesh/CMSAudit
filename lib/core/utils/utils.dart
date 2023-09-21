import 'dart:convert';
import 'dart:io';

import 'package:cms_audit/core/utils/db_api_status.dart';
import 'package:cms_audit/core/utils/widgets/custom_date_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:tool_kit/tool_kit.dart';
import '../../domain/share_preference/shared_preference_repository.dart';
import '../constants/constants.dart';
import 'custom_color.dart';
import 'package:intl/intl.dart';

class Utils {
  /*
* This method is used to validate the email format*/
  static bool isValidEmail(String? email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email ?? "");
    return emailValid;
  }

  static void showUnAuthorizedToken(BuildContext context) async {
    Future.delayed(Duration.zero, () {
      DialogUtils.showCustomDialog(
          context: context,
          themeColor: CustomColor.splashScreenTop,
          heading: "Access Denied",
          desc: "Section token expire, Please login again.",
          positiveBtn: "Login",
          positiveClick: () {
            clearCacheAndNavigateToLogin(context);
          },
          willPop: false);
    });
  }

  static void clearCacheAndNavigateToLogin(BuildContext context) async {
    await SharedPreferenceRepository().setAccessToken(null);
    Navigator.pushReplacementNamed(
        context, AppRoute.getScreenRoute(LOGIN_SCREEN));
  }

  static String getNewGuId() {
    return Guid.newGuid.value;
  }

  static String getDisplayFormat(String s) {
    final DateFormat inputFormatter = DateFormat("yyyy-MM-ddThh:mm:ss");
    final DateFormat outputFormatter = DateFormat("yyyy-MM-dd, hh:mm aa");
    try {
      return outputFormatter.format(inputFormatter.parse(s));
    } catch (e) {
      print("Exception :${e.toString()}");
      return "n/a";
    }
  }

  /*This method will return the  Component with header*/
  static Widget getTextFieldComponent(
      {required String header,
      required String hint,
      required TextEditingController? textEditingController,
      bool isNumber = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
              color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 56,
          child: TextField(
            textCapitalization: TextCapitalization.sentences,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            textInputAction: TextInputAction.next,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            controller: textEditingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding:
                  const EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  /*This method will return the  Component with header*/
  static Widget getDropDownComponent(
      {required String header,
      required String hint,
      required List<DropdownDataModel> list,
      required Function(DropdownDataModel?) onChange,
      DropdownDataModel? selectedValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
              color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 56,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: CustomColor.black, width: 0.70),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: DropdownButton<DropdownDataModel>(
                      hint: Text(hint),
                      borderRadius: BorderRadius.circular(10),
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: list.map((DropdownDataModel value) {
                        return DropdownMenuItem<DropdownDataModel>(
                          value: value,
                          child: Text(value.value),
                        );
                      }).toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        print("Inside Selected Value: ${value?.value}");
                        onChange(value);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  /*This method will return the  Component with header*/
  static Widget getSearchDropDownComponent(
      {required String header,
      required String hint,
      required List<DropdownDataModel> list,
      required Function(DropdownDataModel?) onChange,
      DropdownDataModel? selectedValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
              color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 56,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: CustomColor.black, width: 0.70),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownSearch<DropdownDataModel>(
                      clearButtonProps: const ClearButtonProps(isVisible: true),
                      asyncItems: (String filter) {
                        return getFilterData(filter, list);
                      },
                      itemAsString: (DropdownDataModel u) => u.value,
                      onChanged: (DropdownDataModel? data) {
                        onChange(data);
                      },
                      selectedItem: selectedValue,
                      dropdownDecoratorProps: DropDownDecoratorProps(),
                      popupProps: PopupPropsMultiSelection.dialog(
                        fit: FlexFit.tight,
                        title: Container(
                          width: double.infinity,
                          height: 50,
                          color: CustomColor.toolbarBg,
                          child: Center(
                            child: Text(
                              header,
                              style: const TextStyle(
                                  color: CustomColor.white, fontSize: 14),
                            ),
                          ),
                        ),
                        isFilterOnline: true,
                        searchDelay: const Duration(microseconds: 1),
                        showSelectedItems: false,
                        showSearchBox: true,
                        searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.only(
                              left: 15, right: 15, top: 2, bottom: 2),
                          hintText: "Search $header",
                          filled: true,
                          fillColor: Colors.white,
                        )),
                        itemBuilder: (context, value, b) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        value.value,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 1,
                                color: CustomColor.grey,
                              )
                            ],
                          );
                        },
                      )),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  /*This method will return the  Component with header*/
  static Widget getDatePickerTextFieldComponent(
      {required String header,
      required String hint,
      required TextEditingController? textEditingController,
      required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
              color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 56,
          child: TextField(
            onTap: () {
              _selectDate(context, textEditingController);
            },
            focusNode: AlwaysDisabledFocusNode(),
            textInputAction: TextInputAction.next,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            controller: textEditingController,
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.calendar_today,
                size: 15,
                color: CustomColor.black,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding:
                  const EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  static _selectDate(BuildContext context,
      TextEditingController? textEditingController) async {
    final DateFormat outputFormatter = DateFormat("yyyy-MM-dd");
    // DateTime? newSelectedDate = await showDatePicker(
    //   initialEntryMode:DatePickerEntryMode.input,
    //   context: context,
    //   firstDate: DateTime(2000),
    //   lastDate: DateTime(2040),
    //   initialDate: DateTime.now(),
    // );

    showDialog(
        context: context,
        builder: (context) {
          return CustomDatePicker(onDateChange: (value) {
            if (value != null) {
              textEditingController?.text = outputFormatter.format(value);
            }
          });
        });
  }

  static Future<List<DropdownDataModel>> getFilterData(
      String filter, List<DropdownDataModel> list) async {
    if (filter.length == 0) {
      return list;
    } else {
      List<DropdownDataModel> filteredList = list
          .where((e) => e.value.toLowerCase().contains(filter.toLowerCase()))
          .toList();
      return filteredList;
    }
  }

  static List<DropdownDataModel> stockType = [
    DropdownDataModel(key: "Case", value: "Case"),
    DropdownDataModel(key: "Pkt", value: "Pkt"),
    DropdownDataModel(key: "Kg", value: "kg")
  ];
  static List<DropdownDataModel> invoiceType = [
    DropdownDataModel(key: "InWard", value: "InWard"),
    DropdownDataModel(key: "OutWard", value: "OutWard"),
  ];
  static List<DropdownDataModel> productType = [
    DropdownDataModel(key: "Good", value: "Good"),
    DropdownDataModel(key: "Damage", value: "Damage"),
    DropdownDataModel(key: "Expired", value: "Expired"),
  ];

  static Map<String, String> getProductImageJson(String productImageUri) {
    Map<String, String> productJson = Map();
    try {
      File file = File(productImageUri);
      productJson["name"] = file.path.split(Platform.pathSeparator).last;
      productJson["extension"] =
          file.path.split(Platform.pathSeparator).last.split(".").last;
      productJson["data"] = base64Encode(file.readAsBytesSync());
    } catch (e) {
      print("Exception getProductImageJson:${e.toString()}");
    }
    return productJson;
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class DropdownDataModel {
  String key;
  String value;

  DropdownDataModel({required this.key, required this.value});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['key'] = this.key;
    return data;
  }
}
