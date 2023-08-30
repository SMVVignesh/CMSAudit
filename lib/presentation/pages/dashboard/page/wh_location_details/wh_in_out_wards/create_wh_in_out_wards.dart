import 'dart:ffi';

import 'package:cms_audit/core/utils/custom_color.dart';
import 'package:cms_audit/domain/local_data_base/data_base_repository.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/audit_details/model/audit_response.dart';
import 'package:flutter/material.dart';
import 'package:tool_kit/tool_kit.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../domain/local_data_base/database.dart';
import '../../products/model/product_response.dart';

class CreateWHInOutWardsScreen extends StatefulWidget {
  Data auditDetails;
  WHLocationTable? location;
  WHInOutWardsTable? inOutWard;

  CreateWHInOutWardsScreen(
      {super.key,
      required this.auditDetails,
      required this.location,
      this.inOutWard});

  @override
  State<CreateWHInOutWardsScreen> createState() =>
      _CreateWHInOutWardsScreenState();
}

class _CreateWHInOutWardsScreenState extends State<CreateWHInOutWardsScreen> {
  TextEditingController customerNameTextEditingController =
      TextEditingController();
  TextEditingController invoiceNumberTextEditingController =
      TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();
  TextEditingController qtyTextEditingController = TextEditingController();
  TextEditingController invoiceDateTextEditingController =
      TextEditingController();
  DropdownDataModel? selectedStockType;
  DropdownDataModel? selectedInvoiceType;
  DropdownDataModel? selectedProducts;
  List<DropdownDataModel> products = [];

  @override
  void initState() {
    super.initState();
    updateProductList();
    if (widget.inOutWard != null) {
      qtyTextEditingController.text = widget.inOutWard?.qty.toString() ?? "";
      invoiceNumberTextEditingController.text = widget.inOutWard?.invoNo ?? "";
      invoiceDateTextEditingController.text = widget.inOutWard?.invoDate ?? "";
      customerNameTextEditingController.text =
          widget.inOutWard?.customerName ?? "";
      descriptionTextEditingController.text =
          widget.inOutWard?.description ?? "";
      selectedStockType = Utils.stockType
          .where(
              (element) => element.key == (widget.inOutWard?.stockType ?? ""))
          .first;
      selectedInvoiceType = Utils.invoiceType
          .where((element) => element.key == (widget.inOutWard?.invoType ?? ""))
          .first;
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
                      "${(widget.inOutWard != null) ? "Edit" : "Create"} In Out Wards",
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
                    Utils.getTextFieldComponent(
                        header: "Invoice Number",
                        hint: "Enter Invoice Number",
                        textEditingController:
                            invoiceNumberTextEditingController),
                    Utils.getDropDownComponent(
                        header: "Invoice Type",
                        hint: "Select Invoice Type",
                        selectedValue: selectedInvoiceType,
                        list: Utils.invoiceType,
                        onChange: (value) {
                          setState(() {
                            selectedInvoiceType = value;
                          });
                        }),
                    Utils.getDatePickerTextFieldComponent(
                        header: "Invoice Date",
                        hint: "Select Invoice Date",
                        textEditingController: invoiceDateTextEditingController,
                        context: context),
                    Utils.getTextFieldComponent(
                        header: "Customer Name",
                        hint: "Enter Customer Name",
                        textEditingController:
                            customerNameTextEditingController),
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
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                textAlign: TextAlign.center,
                                (widget.inOutWard == null) ? "Save" : "Update",
                                style: const TextStyle(
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
    String customerName = customerNameTextEditingController.text;
    String invoiceNumber = invoiceNumberTextEditingController.text;
    String description = descriptionTextEditingController.text;
    String invoiceDate = invoiceDateTextEditingController.text;

    if (selectedProducts == null) {
      SnackBarUtils.showError(context, "Select Product");
    } else if (qty.length == 0) {
      SnackBarUtils.showError(context, "Enter the Quantity");
    } else if (selectedStockType == null) {
      SnackBarUtils.showError(context, "Select Stock Type");
    } else if (invoiceNumber.length == 0) {
      SnackBarUtils.showError(context, "Enter the Invoice Number");
    } else if (selectedInvoiceType == null) {
      SnackBarUtils.showError(context, "Select Invoice Type");
    } else if (invoiceDate.length == 0) {
      SnackBarUtils.showError(context, "Select Invoice Date");
    } else if (customerName.length == 0) {
      SnackBarUtils.showError(context, "Enter Customer Name");
    } else {
      try {
        bool isLocationUpdated = widget.location?.isLocationUpdated ?? false;

        if (widget.inOutWard != null) {
          await DatabaseRepository().updateWHInOutWard(
              qty: convertToInt(qty),
              stockType: selectedStockType?.key ?? "",
              description: description,
              invoNo: invoiceNumber,
              invoType: selectedInvoiceType?.key ?? "",
              invoDate: invoiceDate,
              customerName: customerName,
              whLocationId: widget.location?.locationId ?? "",
              auditDetailId: widget.auditDetails.id ?? "",
              productId: selectedProducts?.key ?? "",
              productName: selectedProducts?.value ?? "",
              inOutWardId: widget.inOutWard?.inOutWardId ?? "");
        } else {
          await DatabaseRepository().insertWHInOutWard(
              qty: convertToInt(qty),
              stockType: selectedStockType?.key ?? "",
              description: description,
              invoNo: invoiceNumber,
              invoType: selectedInvoiceType?.key ?? "",
              invoDate: invoiceDate,
              customerName: customerName,
              whLocationId: widget.location?.locationId ?? "",
              auditDetailId: widget.auditDetails.id ?? "",
              productId: selectedProducts?.key ?? "",
              productName: selectedProducts?.value ?? "",
              isLocationUpdated: isLocationUpdated);
        }
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
    selectedProducts = products
        .where((element) => element.key == (widget.inOutWard?.productId ?? ""))
        .first;
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
