import 'package:cms_audit/core/utils/db_api_status.dart';
import 'package:cms_audit/core/utils/utils.dart';
import 'package:cms_audit/domain/api/api_repository.dart';
import 'package:cms_audit/domain/local_data_base/data_base_repository.dart';
import 'package:cms_audit/domain/local_data_base/database.dart';
import 'package:flutter/material.dart';
import 'package:tool_kit/tool_kit.dart';
import '../../../../../../core/utils/custom_color.dart';
import '../../products/model/product_response.dart';
import '../model/upload_model.dart';

class UploadDataScreen extends StatefulWidget {
  const UploadDataScreen({super.key});

  @override
  State<UploadDataScreen> createState() => _UploadDataScreenState();
}

class _UploadDataScreenState extends State<UploadDataScreen> {
  List<UploadDataModel> list = [];
  bool isWHLocationLoading = false;
  bool isWHAuditingLoading = false;
  bool isWHInOutWardsLoading = false;
  int? whLocationTotalCount;
  int? whLocationCompletedCount;
  int? whLocationErrorCount;

  int? whAuditingTotalCount;
  int? whAuditingCompletedCount;
  int? whAuditingErrorCount;

  int? whInOutWardTotalCount;
  int? whInOutWardCompletedCount;
  int? whInOutWardErrorCount;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    updateAllData();
  }

  @override
  Widget build(BuildContext context) {
    updateModel();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              UploadDataModel item = list[index];
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
                                style: const TextStyle(
                                    color: CustomColor.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Completed :   ${item.completedCount ?? ""} /${item.totalCount ?? ""}",
                                style: const TextStyle(
                                    color: CustomColor.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                              if ((item.errorCount ?? 0) > 0)
                                Text(
                                  "Error :   ${item.errorCount ?? ""}",
                                  style: const TextStyle(
                                      color: CustomColor.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                )
                            ],
                          ),
                        ),
                        if (item.isLoading)
                          const Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                    strokeWidth: 3,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
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
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                  child: isLoading
                      ? const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                                strokeWidth: 3,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                "Please wait. We are uploading data. Don't go back or close the app.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: CustomColor.black, fontSize: 14),
                              ),
                            ),
                          ],
                        )
                      : GestureDetector(
                          onTap: () async {
                            uploadAllData();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: CustomColor.toolbarBg,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  top: 15, bottom: 15, left: 10, right: 10),
                              child: Text(
                                textAlign: TextAlign.center,
                                "Upload Offline Data",
                                style: TextStyle(
                                    fontSize: 14, color: CustomColor.white),
                              ),
                            ),
                          ),
                        )),
            ],
          ),
        )
      ],
    );
  }

  void updateModel() {
    list.clear();
    list.add(UploadDataModel(
        id: 1,
        name: "WH Locations",
        totalCount: whLocationTotalCount,
        completedCount: whLocationCompletedCount,
        errorCount: whLocationErrorCount,
        isLoading: isWHLocationLoading));
    list.add(UploadDataModel(
        id: 2,
        name: "WH Auditings",
        totalCount: whAuditingTotalCount,
        completedCount: whAuditingCompletedCount,
        errorCount: whAuditingErrorCount,
        isLoading: isWHAuditingLoading));
    list.add(UploadDataModel(
        id: 3,
        name: "WH In Out Wards",
        totalCount: whInOutWardTotalCount,
        completedCount: whInOutWardCompletedCount,
        errorCount: whInOutWardErrorCount,
        isLoading: isWHInOutWardsLoading));
  }

  void getProducts() async {
    try {
      showLoading(0, true, message: "Fetching Products...");
      ProductResponse productResponse = await ApiRepository().getProducts();
      await DatabaseRepository().saveProductData(productResponse);
      showLoading(0, false);
      SnackBarUtils.showSuccess(context, "Updated Products");
    } on UnauthorisedException {
      showLoading(0, false);
      Utils.showUnAuthorizedToken(context);
    } catch (e) {
      showLoading(0, false);
      SnackBarUtils.showError(context, e.toString());
    }
  }

  showLoading(int index, bool loading, {String? message}) {
    setState(() {
      switch (index) {
        case 0:
          {
            isWHLocationLoading = loading;
            break;
          }
        case 1:
          {
            isWHAuditingLoading = loading;
            break;
          }
        case 2:
          {
            isWHInOutWardsLoading = loading;
            break;
          }
      }
    });
  }

  void updateAllData() async {
    updateWHLocations();

    updateWHAuditing();

    updateWhInOutWards();
  }

  void uploadAllData() async {
    if (whLocationTotalCount == whLocationCompletedCount &&
        whAuditingTotalCount == whAuditingCompletedCount &&
        whInOutWardTotalCount == whInOutWardCompletedCount) {
      if (context.mounted) {
        SnackBarUtils.showSuccess(context, "All data already uploaded");
      }
    } else {
      // InternetInfoUtils.hasConnection().then((value) {
      //   if (value) {
      //     uploadWhLocationsData();
      //     uploadWhInOutWardsData();
      //   } else {
      //     if (context.mounted) {
      //       SnackBarUtils.showError(context, "No Internet Connection");
      //     }
      //   }
      // });
      uploadWhLocationsData();
      uploadWhInOutWardsData();
      uploadWhAuditingData();
    }
  }

  void updateWHLocations() async {
    DatabaseRepository().getAllWHLocation().then((value) {
      whLocationTotalCount = value.length;
      whLocationCompletedCount = (value.where((element) =>
          (element.apiStatus == DB_API_STATUS.COMPLETED.name) ||
          (element.apiStatus == DB_API_STATUS.NO_CHANGES.name))).length;
      whLocationErrorCount = (value.where(
          (element) => element.apiStatus == DB_API_STATUS.ERROR.name)).length;
      if (context.mounted) {
        setState(() {});
      }
    });
  }

  void updateWHAuditing() async {
    DatabaseRepository().getAllWHAuditing().then((value) {
      whAuditingTotalCount = value.length;
      whAuditingCompletedCount = (value.where((element) =>
          (element.apiStatus == DB_API_STATUS.COMPLETED.name) ||
          (element.apiStatus == DB_API_STATUS.NO_CHANGES.name))).length;
      whAuditingErrorCount = (value.where(
          (element) => element.apiStatus == DB_API_STATUS.ERROR.name)).length;
      if (context.mounted) {
        setState(() {});
      }
    });
  }

  void updateWhInOutWards() async {
    DatabaseRepository().getAllInOutWards().then((value) {
      whInOutWardTotalCount = value.length;
      whInOutWardCompletedCount = (value.where((element) =>
          (element.apiStatus == DB_API_STATUS.COMPLETED.name) ||
          (element.apiStatus == DB_API_STATUS.NO_CHANGES.name))).length;
      whInOutWardErrorCount = (value.where(
          (element) => element.apiStatus == DB_API_STATUS.ERROR.name)).length;
      if (context.mounted) {
        setState(() {});
      }
    });
  }

  void uploadWhLocationsData() async {
    DatabaseRepository().getAllWHLocation().then((value) async {
      for (WHLocationTable locationItem in value) {
        if (!locationItem.isLocationUpdated) {
          setState(() {
            isLoading = true;
          });
          try {
            final response = await ApiRepository()
                .createWHLocation(whLocationTable: locationItem);
            await DatabaseRepository().updateWHLocationId(
                oldLocationId: locationItem.locationId,
                newLocationId: response.locationId ?? "");
            setState(() {
              isLoading = false;
            });
            updateWHLocations();
            uploadWhInOutWardsData();
            uploadWhAuditingData();
          } catch (e) {
            setState(() {
              isLoading = false;
            });
            SnackBarUtils.showError(context, e.toString());
          }
        }
      }
    });
  }

  void uploadWhInOutWardsData() async {
    DatabaseRepository().getAllInOutWards().then((value) async {
      for (WHInOutWardsTable whInOutItem in value) {
        if (whInOutItem.isLocationUpdated &&
            (whInOutItem.apiStatus != DB_API_STATUS.COMPLETED.name) &&
            (whInOutItem.apiStatus != DB_API_STATUS.NO_CHANGES.name)) {
          setState(() {
            isLoading = true;
          });
          try {
            final response = await ApiRepository()
                .createInOutWards(whInOutWardsTable: whInOutItem);
            await DatabaseRepository().updateWHInOutWardApiStatus(
                inOutWardId: whInOutItem.inOutWardId,
                newInOutWardId: response.inOutWardsId,
                status: DB_API_STATUS.COMPLETED);
            setState(() {
              isLoading = false;
            });
            updateWhInOutWards();
          } catch (e) {
            await DatabaseRepository().updateWHInOutWardApiStatus(
                inOutWardId: whInOutItem.inOutWardId,
                status: DB_API_STATUS.ERROR);
            setState(() {
              isLoading = false;
            });
            SnackBarUtils.showError(context, e.toString());
          }
        }
      }
    });
  }

  void uploadWhAuditingData() async {
    DatabaseRepository().getAllWHAuditing().then((value) async {
      for (WHAuditingTable whAuditingItem in value) {
        print(
            "whAuditingItem.isLocationUpdated ${whAuditingItem.isLocationUpdated} whAuditingItem.apiStatus: ${whAuditingItem.apiStatus}");
        if (whAuditingItem.isLocationUpdated &&
            (whAuditingItem.apiStatus != DB_API_STATUS.COMPLETED.name) &&
            (whAuditingItem.apiStatus != DB_API_STATUS.NO_CHANGES.name)) {
          setState(() {
            isLoading = true;
          });
          try {
            final response = await ApiRepository()
                .createOrUpdateWhAuditing(wHAuditingTable: whAuditingItem);
            await DatabaseRepository().updateWHAuditingApiStatus(
                auditingId: whAuditingItem.auditingId,
                newAuditId: response.inOutWardsId,
                status: DB_API_STATUS.COMPLETED);
            setState(() {
              isLoading = false;
            });
            updateWHAuditing();
          } catch (e) {
            await DatabaseRepository().updateWHAuditingApiStatus(
                auditingId: whAuditingItem.auditingId,
                status: DB_API_STATUS.ERROR);
            setState(() {
              isLoading = false;
            });
            SnackBarUtils.showError(context, e.toString());
          }
        }
      }
    });
  }
}
