import 'package:cms_audit/core/utils/custom_color.dart';
import 'package:cms_audit/domain/local_data_base/database.dart';
import 'package:cms_audit/presentation/base/custom_state.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/audit_details/model/audit_response.dart';
import 'package:flutter/material.dart';
import 'package:tool_kit/tool_kit.dart';

import '../../../../../../domain/local_data_base/data_base_repository.dart';

class WHAuditing extends StatefulWidget {
  Data auditDetails;
  WHLocationTable location;

  WHAuditing({super.key, required this.auditDetails, required this.location});

  @override
  State<WHAuditing> createState() => _WHAuditingState();
}

class _WHAuditingState extends CustomState<WHAuditing> {
  List<WHLocationTable> list = [];

  @override
  void initState() {
    super.initState();
    updateWHAuditing();
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
            updateWHAuditing();
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
                            "No Auditings available",
                            style: TextStyle(
                                color: CustomColor.black, fontSize: 14),
                          ),
                        )
                      : ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            WHLocationTable location = list[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           WHAuditingDetails(
                                  //             auditDetails: widget.auditDetails,
                                  //             location: location,
                                  //           )),
                                  // );
                                },
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Location:   ${location.locationName}",
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
                                                  // await showDialog(
                                                  //     context: context,
                                                  //     barrierColor:
                                                  //         Colors.transparent,
                                                  //     builder: (context) {
                                                  //       return CreateWHAuditingcreen(
                                                  //           whLocationTable:
                                                  //               location,
                                                  //           auditDetails: widget
                                                  //               .auditDetails);
                                                  //     });
                                                  updateWHAuditing();
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
                                                      location);
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
                                          "Pallet Number:    ${location.palletNumber}",
                                          style: const TextStyle(
                                              color: CustomColor.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Description:   ${location.description}",
                                          style: const TextStyle(
                                              color: CustomColor.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Is Active:   ${location.isActive}",
                                          style: const TextStyle(
                                              color: CustomColor.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
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

  void updateWHAuditing() async {
    DatabaseRepository()
        .getWHLocationByAuditId(widget.auditDetails.id ?? "")
        .then((value) {
      list.clear();
      list.addAll(value);
      setState(() {});
    });
  }

  void showDeleteConfirmationPopUp(WHLocationTable location) {
    DialogUtils.showCustomDialog(
        context: context,
        themeColor: CustomColor.splashScreenTop,
        heading: "",
        desc: "Are you sure you want to Delete ${location.locationName}?",
        positiveBtn: "Delete",
        positiveClick: () {
          deleteLocation(location);
        },
        negativeBtn: "Cancel",
        negativeClick: () {
          Navigator.pop(context);
        });
  }

  void deleteLocation(WHLocationTable location) async {
    await DatabaseRepository().deleteWHLocation(
        locationName: location.locationName,
        palletNumber: location.palletNumber,
        auditDetailId: location.auditDetailId);
    updateWHAuditing();
  }
}
