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

  CreateWHAuditingScreen(
      {super.key,
      required this.auditDetails,
      required this.location,
      this.auditingTable});

  @override
  State<CreateWHAuditingScreen> createState() => _CreateWHAuditingScreenState();
}

class _CreateWHAuditingScreenState extends State<CreateWHAuditingScreen> {
  TextEditingController bestBeforeTextEditingController =
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
      bestBeforeTextEditingController.text =
          widget.auditingTable?.bestBefore.toString() ?? "";
      descriptionTextEditingController.text =
          widget.auditingTable?.description ?? "";
      qtyTextEditingController.text =
          widget.auditingTable?.qty.toString() ?? "";
      mFDateTextEditingController.text = widget.auditingTable?.mfDate ?? "";
      selectedStockType = Utils.stockType
          .where((element) =>
              element.key == (widget.auditingTable?.stockType ?? ""))
          .first;
      selectedProductType = Utils.productType
          .where((element) =>
              element.key == (widget.auditingTable?.productQuality ?? ""))
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "${(widget.auditingTable != null) ? "Edit" : "Create"} Auditing",
                            style: const TextStyle(
                                color: CustomColor.toolbarBg,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.close,
                                size: 20,
                                color: CustomColor.black,
                              ),
                            ),
                          ),
                        )
                      ],
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
                        if (widget.auditingTable == null)
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              validateFields(true);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: CustomColor.toolbarBg.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Save & Create",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14, color: CustomColor.white),
                                ),
                              ),
                            ),
                          )),
                        if (widget.auditingTable == null)
                          const SizedBox(
                            width: 25,
                          ),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            validateFields(false);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: CustomColor.toolbarBg,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                textAlign: TextAlign.center,
                                (widget.auditingTable == null)
                                    ? "Save"
                                    : "Update",
                                style: TextStyle(
                                    fontSize: 14, color: CustomColor.white),
                              ),
                            ),
                          ),
                        )),
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

  void validateFields(bool createAnother) async {
    String qty = qtyTextEditingController.text;
    String bestBefore = bestBeforeTextEditingController.text;
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
        bool isLocationUpdated = widget.location?.isLocationUpdated??false;
        print("isLocationUpdated :$isLocationUpdated");

        if (widget.auditingTable != null) {
          await DatabaseRepository().updateWHAuditing(
              qty: convertToInt(qty),
              bestBefore: convertToInt(bestBefore),
              stockType: selectedStockType?.key ?? "",
              productQuality: selectedProductType?.key ?? "",
              productId: selectedProducts?.key ?? "",
              productName: selectedProducts?.value ?? "",
              whLocationId:widget.location?.locationId ?? "",
              auditDetailId: widget.auditDetails.id ?? "",
              description: description,
              mfDate: mfDate,
              file: "",
              auditingId: widget.auditingTable?.auditingId ?? "");
        } else {
          await DatabaseRepository().insertWHAuditing(
              qty: convertToInt(qty),
              bestBefore: convertToInt(bestBefore),
              stockType: selectedStockType?.key ?? "",
              productQuality: selectedProductType?.key ?? "",
              productId: selectedProducts?.key ?? "",
              productName: selectedProducts?.value ?? "",
              whLocationId: widget.location?.locationId ?? "",
              auditDetailId: widget.auditDetails.id ?? "",
              description: description,
              mfDate: mfDate,
              isLocationUpdated: isLocationUpdated,
              file: "");
        }
        if (createAnother) {
          setState(() {
            qtyTextEditingController.text = "";
            selectedStockType = null;
          });
        } else if (context.mounted) {
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

    selectedProducts = products
        .where(
            (element) => element.key == (widget.auditingTable?.productId ?? ""))
        .first;
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
