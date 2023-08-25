import 'package:cms_audit/core/utils/utils.dart';
import 'package:cms_audit/domain/api/api_repository.dart';
import 'package:cms_audit/domain/local_data_base/data_base_repository.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/audit_details/model/audit_response.dart';
import 'package:flutter/material.dart';
import 'package:tool_kit/tool_kit.dart';

import '../../../../../../core/utils/custom_color.dart';
import '../../products/model/product_response.dart';
import '../model/update_model.dart';
import 'package:intl/intl.dart';

class UpdateListScreen extends StatefulWidget {
  const UpdateListScreen({super.key});

  @override
  State<UpdateListScreen> createState() => _UpdateListScreenState();
}

class _UpdateListScreenState extends State<UpdateListScreen> {
  bool isLoading = false;
  String loadingMessage = "";
  List<UpdateModel> list = [];
  String? productLastUpdatedDate;
  String? auditLastUpdatedDate;

  @override
  void initState() {
    super.initState();
    updateLastUpdateDates();
  }

  @override
  Widget build(BuildContext context) {
    updateModel();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              UpdateModel item = list[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                    color: CustomColor.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Last Updated:   ${item.lastUpdatedDate ?? "n/a"}",
                                style: TextStyle(
                                    color: CustomColor.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!isLoading) {
                              updateApi(item);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: CustomColor.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              child: Text(
                                "Update",
                                style: TextStyle(
                                    color: CustomColor.white, fontSize: 14),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    color: CustomColor.textGrey,
                  )
                ],
              );
            },
            itemCount: list.length,
          ),
        ),
        if (isLoading)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              loadingMessage,
              style: const TextStyle(fontSize: 14, color: CustomColor.black),
            ),
          ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  void updateModel() {
    list.clear();
    list.add(UpdateModel(
        id: 1, name: "Products", lastUpdatedDate: productLastUpdatedDate));
    list.add(UpdateModel(
        id: 2, name: "Audit", lastUpdatedDate: auditLastUpdatedDate));
  }

  void updateApi(UpdateModel item) {
    switch (item.id) {
      case 1:
        getProducts();
        break;
      case 2:
        getAuditList();
        break;
    }
  }

  void getProducts() async {
    try {
      showLoading(true, message: "Fetching Products...");
      ProductResponse productResponse = await ApiRepository().getProducts();
      await DatabaseRepository().saveProductData(productResponse);
      updateLastUpdateDates();
      showLoading(false);
      SnackBarUtils.showSuccess(context, "Updated Products");
    } on UnauthorisedException {
      showLoading(false);
      Utils.showUnAuthorizedToken(context);
    } catch (e) {
      showLoading(false);
      SnackBarUtils.showError(context, e.toString());
    }
  }

  void getAuditList() async {
    try {
      showLoading(true, message: "Fetching All Audit...");
      AuditResponse auditResponse = await ApiRepository().getAuditList();
      await DatabaseRepository().saveAuditData(auditResponse);
      updateLastUpdateDates();
      showLoading(false);
      SnackBarUtils.showSuccess(context, "Updated Audit");
    } on UnauthorisedException {
      showLoading(false);
      Utils.showUnAuthorizedToken(context);
    } catch (e) {
      showLoading(false);
      SnackBarUtils.showError(context, e.toString());
    }
  }

  showLoading(bool loading, {String? message}) {
    setState(() {
      isLoading = loading;
      loadingMessage = message ?? "";
    });
  }

  void updateLastUpdateDates() async {
    final DateFormat formatter = DateFormat('dd-MMM-yyyy, hh:mm aa');
    DateTime? productUpdatedDateTime =
        await DatabaseRepository().getProductUpdatedDate();
    if (productUpdatedDateTime != null) {
      setState(() {
        productLastUpdatedDate = formatter.format(productUpdatedDateTime);
      });
    }

    DateTime? auditUpdatedDateTime =
        await DatabaseRepository().getAuditUpdatedDate();
    if (auditUpdatedDateTime != null) {
      setState(() {
        auditLastUpdatedDate = formatter.format(auditUpdatedDateTime);
      });
    }
  }
}
