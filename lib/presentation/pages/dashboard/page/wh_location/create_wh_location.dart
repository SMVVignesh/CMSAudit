import 'package:cms_audit/core/utils/custom_color.dart';
import 'package:cms_audit/domain/local_data_base/data_base_repository.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/audit_details/model/audit_response.dart';
import 'package:flutter/material.dart';
import 'package:tool_kit/tool_kit.dart';

import '../../../../../domain/local_data_base/database.dart';

class CreateWHLocationScreen extends StatefulWidget {
  Data auditDetails;
  WHLocationTable? whLocationTable;

  CreateWHLocationScreen(
      {super.key, required this.auditDetails, this.whLocationTable});

  @override
  State<CreateWHLocationScreen> createState() => _CreateWHLocationScreenState();
}

class _CreateWHLocationScreenState extends State<CreateWHLocationScreen> {
  TextEditingController locationTextEditingController = TextEditingController();
  TextEditingController palletNumberTextEditingController =
      TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.whLocationTable != null) {
      locationTextEditingController.text =
          widget.whLocationTable?.locationName ?? "";
      palletNumberTextEditingController.text =
          widget.whLocationTable?.palletNumber ?? "";
      descriptionTextEditingController.text =
          widget.whLocationTable?.description ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.6),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 10, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${(widget.whLocationTable != null) ? "Edit" : "Create"} Location",
                    style: const TextStyle(
                        color: CustomColor.toolbarBg,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  getTextFieldComponent(
                      header: "Location",
                      hint: "Enter Location",
                      textEditingController: locationTextEditingController),
                  getTextFieldComponent(
                      header: "Pallet Number",
                      hint: "Enter Pallet Number",
                      textEditingController: palletNumberTextEditingController),
                  getTextFieldComponent(
                      header: "Description",
                      hint: "Enter Description",
                      textEditingController: descriptionTextEditingController),
                  SizedBox(
                    height: 10,
                  ),
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
                              style: TextStyle(
                                  fontSize: 14, color: CustomColor.black),
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
                          validateFields();
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
        ),
      ),
    );
  }

  /*This method will return the  Component with header*/
  Widget getTextFieldComponent(
      {required String header,
      required String hint,
      required TextEditingController? textEditingController}) {
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

  void validateFields() async {
    String locationName = locationTextEditingController.text;
    String palletNumber = palletNumberTextEditingController.text;
    String description = descriptionTextEditingController.text;

    if (locationName.length == 0) {
      SnackBarUtils.showError(context, "Enter the location");
    } else if (palletNumber.length == 0) {
      SnackBarUtils.showError(context, "Enter the Pallet Number");
    } else {
      try {
        await DatabaseRepository().insertWHLocation(
            locationName: locationName,
            palletNumber: "$locationName$palletNumber",
            description: description,
            auditDetailId: widget.auditDetails.id ?? "",
            isActive: true);
        if (context.mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        print(e.toString());
        SnackBarUtils.showError(context, "This Location and Pallet is already exists");
      }
    }
  }
}
