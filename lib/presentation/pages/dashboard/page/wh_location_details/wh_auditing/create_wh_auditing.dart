import 'dart:ffi';

import 'package:cms_audit/core/utils/custom_color.dart';
import 'package:cms_audit/domain/local_data_base/data_base_repository.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/audit_details/model/audit_response.dart';
import 'package:flutter/material.dart';
import 'package:tool_kit/tool_kit.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../domain/local_data_base/database.dart';
import '../../products/model/product_response.dart';

class CreateWHAuditingScreen extends StatefulWidget {
  Data auditDetails;
  WHLocationTable? location;
  WHAuditingTable? auditingTable;

  CreateWHAuditingScreen({super.key,
    required this.auditDetails,
    required this.location,
    this.auditingTable});

  @override
  State<CreateWHAuditingScreen> createState() => _CreateWHAuditingScreenState();
}

class _CreateWHAuditingScreenState extends State<CreateWHAuditingScreen> {
  TextEditingController bestBeforeTextEditingController =
  TextEditingController();
  TextEditingController invoiceNumberTextEditingController =
  TextEditingController();
  TextEditingController descriptionTextEditingController =
  TextEditingController();
  TextEditingController qtyTextEditingController = TextEditingController();
  TextEditingController mFDateTextEditingController = TextEditingController();
  DropdownDataModel? selectedStockType;
  DropdownDataModel? selectedProductType;
  DropdownDataModel? selectedProducts;

  List<DropdownDataModel> products = [];

  @override
  void initState() {
    super.initState();
    updateProductList();
    if (widget.auditingTable != null) {
      // bestBeforeTextEditingController.text =
      //     widget.location?.locationName ?? "";
      // invoiceNumberTextEditingController.text =
      //     widget.location?.palletNumber ?? "";
      // descriptionTextEditingController.text =
      //     widget.location?.description ?? "";
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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, right: 10, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${(widget.auditingTable != null)
                          ? "Edit"
                          : "Create"} Auditing",
                      style: const TextStyle(
                          color: CustomColor.toolbarBg,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Utils.getSearchDropDownComponent(
                        header: "Product",
                        hint: "Select Product",
                        selectedValue: selectedProducts,
                        list: products,
                        onChange: (value) {
                          setState(() {
                            selectedProducts = value;
                          });
                        }),
                    Utils.getTextFieldComponent(
                        header: "Qty",
                        hint: "Enter Qty",
                        isNumber: true,
                        textEditingController: qtyTextEditingController),
                    Utils.getDropDownComponent(
                        header: "Stock Type",
                        hint: "Select Stock Type",
                        selectedValue: selectedStockType,
                        list: Utils.stockType,
                        onChange: (value) {
                          setState(() {
                            selectedStockType = value;
                          });
                        }),
                    Utils.getDropDownComponent(
                        header: "Product Type",
                        hint: "Select Product Type",
                        selectedValue: selectedProductType,
                        list: Utils.productType,
                        onChange: (value) {
                          setState(() {
                            selectedProductType = value;
                          });
                        }),
                    Utils.getDatePickerTextFieldComponent(
                        header: "MF Date",
                        hint: "Select MF Date",
                        textEditingController: mFDateTextEditingController,
                        context: context),
                    Utils.getTextFieldComponent(
                        header: "Best before",
                        hint: "Enter Best Before",
                        textEditingController: bestBeforeTextEditingController,
                        isNumber: true),
                    Utils.getTextFieldComponent(
                        header: "Description",
                        hint: "Enter Description",
                        textEditingController:
                        descriptionTextEditingController),
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
      ),
    );
  }

  void validateFields() async {
    String qty = qtyTextEditingController.text;
    String bestBefore = bestBeforeTextEditingController.text;
    String invoiceNumber = invoiceNumberTextEditingController.text;
    String description = descriptionTextEditingController.text;
    String mfDate = mFDateTextEditingController.text;

    if (selectedProducts == null) {
      SnackBarUtils.showError(context, "Select Product");
    } else if (qty.length == 0) {
      SnackBarUtils.showError(context, "Enter the Quantity");
    } else if (selectedStockType == null) {
      SnackBarUtils.showError(context, "Select Stock Type");
    } else if (selectedProductType == null) {
      SnackBarUtils.showError(context, "Select Product Type");
    } else if (mfDate.length == 0) {
      SnackBarUtils.showError(context, "Select MF Date");
    } else if (bestBefore.length == 0) {
      SnackBarUtils.showError(context, "Enter Best Before");
    } else {
      try {
        await DatabaseRepository().insertWHAuditing(qty: convertToInt(qty),
            bestBefore: convertToInt(bestBefore),
            stockType: selectedStockType?.key??"",
            productQuality: selectedProductType?.key??"",
            productId: selectedProducts?.key??"",
            productName: selectedProducts?.value??"",
            whLocationId: widget.location?.locationId??"",
            auditDetailId: widget.auditDetails.id??"",
            description: description,
            mfDate: mfDate,
            file: "");

        if (context.mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        print(e.toString());
        SnackBarUtils.showError(
            context, "This Location and Pallet is already exists");
      }
    }
  }

  void updateProductList() async {
    products.clear();
    ProductResponse? productResponse =
    await DatabaseRepository().getProductData();
    for (var e in productResponse?.productList ?? []) {
      products.add(DropdownDataModel(key: e.id ?? "", value: e.name ?? ""));
    }
    print("Count---> ${products.length}");
    setState(() {});
  }

  int convertToInt(String qty) {
    try {
      return int.parse(qty);
    } catch (e) {
      return 0;
    }
  }
}
