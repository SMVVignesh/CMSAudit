import 'package:cms_audit/core/utils/custom_color.dart';
import 'package:cms_audit/domain/local_data_base/database.dart';
import 'package:cms_audit/presentation/base/custom_state.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/audit_details/model/audit_response.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/wh_location_details/wh_auditing/create_wh_auditing.dart';
import 'package:flutter/material.dart';
import 'package:tool_kit/tool_kit.dart';

import '../../../../../../domain/local_data_base/data_base_repository.dart';

class WHAuditingScreen extends StatefulWidget {
  Data auditDetails;
  WHLocationTable location;

  WHAuditingScreen({super.key, required this.auditDetails, required this.location});

  @override
  State<WHAuditingScreen> createState() => _WHAuditingScreenState();
}

class _WHAuditingScreenState extends CustomState<WHAuditingScreen> {
  List<WHAuditingTable> list = [];

  @override
  void initState() {
    super.initState();
    updateWHInOutWardsScreen();
  }

  @override
  Widget myBuild(BuildContext context) {
    return Container(
      color: CustomColor.toolbarBg,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: CustomColor.appBG,
            floatingActionButton: GestureDetector(
              onTap: () async {
                await showDialog(
                    context: context,
                    barrierColor: Colors.transparent,
                    builder: (context) {
                      return CreateWHAuditingScreen(
                          location: widget.location,
                          auditDetails: widget.auditDetails);
                    });
                updateWHInOutWardsScreen();
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColor.toolbarBg,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Icon(
                    Icons.add,
                    color: CustomColor.white,
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                      child: (list.length == 0)
                          ? const Center(
                        child: Text(
                          "No Audit available",
                          style: TextStyle(
                              color: CustomColor.black, fontSize: 14),
                        ),
                      )
                          : ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            WHAuditingTable inOutWard = list[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.transparent,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Id:   ${inOutWard.auditingId}",
                                              style: const TextStyle(
                                                  color: CustomColor.black,
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.normal),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          GestureDetector(
                                              onTap: () async {
                                                await showDialog(
                                                    context: context,
                                                    barrierColor:
                                                    Colors.transparent,
                                                    builder: (context) {
                                                      return CreateWHAuditingScreen(
                                                        location:
                                                        widget.location,
                                                        auditDetails:
                                                        widget.auditDetails,
                                                        auditingTable: inOutWard,
                                                      );
                                                    });
                                                updateWHInOutWardsScreen();
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(5),
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: Colors.blue,
                                                    size: 14,
                                                  ),
                                                ),
                                              )),
                                          GestureDetector(
                                              onTap: () {
                                                showDeleteConfirmationPopUp(
                                                    inOutWard);
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(5),
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: Colors.redAccent,
                                                    size: 14,
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Product:    ${inOutWard.productName}",
                                        style: const TextStyle(
                                            color: CustomColor.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Product Quality:    ${inOutWard.productQuality}",
                                        style: const TextStyle(
                                            color: CustomColor.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Qty:    ${inOutWard.qty}",
                                        style: const TextStyle(
                                            color: CustomColor.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Stock Type:    ${inOutWard.stockType}",
                                        style: const TextStyle(
                                            color: CustomColor.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }))
                ],
              ),
            ),
          )),
    );
  }

  Widget getAuditDetails(Data item) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              item.name ?? "",
              style: const TextStyle(
                  color: CustomColor.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Branch:   ${item.branchName ?? "n/a"}",
              style: const TextStyle(
                  color: CustomColor.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }

  @override
  String setScreen() {
    return "WHLocation";
  }

  void updateWHInOutWardsScreen() async {
    DatabaseRepository()
        .getWHAuditingByAuditId(
        widget.auditDetails.id ?? "", widget.location.locationId)
        .then((value) {
      list.clear();
      list.addAll(value);
      setState(() {});
    });
  }

  void showDeleteConfirmationPopUp(WHAuditingTable auditingTable) {
    DialogUtils.showCustomDialog(
        context: context,
        themeColor: CustomColor.splashScreenTop,
        heading: "",
        desc: "Are you sure you want to Delete Id: ${auditingTable.auditingId}?",
        positiveBtn: "Delete",
        positiveClick: () {
          deleteLocation(auditingTable);
        },
        negativeBtn: "Cancel",
        negativeClick: () {
          Navigator.pop(context);
        });
  }

  void deleteLocation(WHAuditingTable auditingTable) async {
    await DatabaseRepository().deleteWHAuditing(guid: auditingTable.auditingId);
    Navigator.pop(context);
    updateWHInOutWardsScreen();
  }
}
