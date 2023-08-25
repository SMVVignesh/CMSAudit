import 'package:cms_audit/core/utils/custom_color.dart';
import 'package:cms_audit/domain/local_data_base/database.dart';
import 'package:cms_audit/presentation/base/custom_state.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/audit_details/model/audit_response.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/wh_location/create_wh_location.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/wh_location_details/wh_location_details.dart';
import 'package:flutter/material.dart';
import 'package:tool_kit/tool_kit.dart';
import '../../../../../domain/local_data_base/data_base_repository.dart';

class WHLocations extends StatefulWidget {
  Data auditDetails;

  WHLocations({super.key, required this.auditDetails});

  @override
  State<WHLocations> createState() => _WHLocationsState();
}

class _WHLocationsState extends CustomState<WHLocations> {
  List<WHLocationTable> list = [];

  @override
  void initState() {
    super.initState();
    updateWHLocations();
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
                  return CreateWHLocationScreen(
                      auditDetails: widget.auditDetails);
                });
            updateWHLocations();
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
        appBar: AppBar(
          backgroundColor: CustomColor.toolbarBg,
          title: const Text(
            "Warehouse Locations",
            style: TextStyle(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Audit details:",
                    style: TextStyle(
                        color: CustomColor.toolbarBg,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              getAuditDetails(widget.auditDetails),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Locations:",
                    style: TextStyle(
                        color: CustomColor.toolbarBg,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: (list.length == 0)
                      ? const Center(
                          child: Text(
                            "No Location available",
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WHLocationsDetails(
                                              auditDetails: widget.auditDetails,
                                              location: location,
                                            )),
                                  );
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
                                                  await showDialog(
                                                      context: context,
                                                      barrierColor:
                                                          Colors.transparent,
                                                      builder: (context) {
                                                        return CreateWHLocationScreen(
                                                            location:
                                                                location,
                                                            auditDetails: widget
                                                                .auditDetails);
                                                      });
                                                  updateWHLocations();
                                                },
                                                child: Container(
                                                  color: Colors.transparent,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: Icon(
                                                      Icons.edit,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              width: 10,
                                            ),
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
                                                      size: 20,
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

  void updateWHLocations() async {
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
        desc: "Are you sure you want to Delete ${location.palletNumber}?",
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
        guid: location.locationId);
    Navigator.pop(context);
    updateWHLocations();
  }
}
