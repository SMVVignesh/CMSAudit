import 'package:cms_audit/core/utils/custom_color.dart';
import 'package:cms_audit/core/utils/db_api_status.dart';
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
  List<WHLocationTable> filteredList = [];
  final TextEditingController _searchController = TextEditingController();

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
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, left: 8, right: 8),
                              child: TextField(
                                  controller: _searchController,
                                  onChanged: (value) {
                                    setState(() {
                                      filterMainList();
                                    });
                                  },
                                  style: TextStyle(color: Colors.black),
                                  cursorColor: Colors.grey,
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    contentPadding: const EdgeInsets.all(0),
                                    hintStyle: TextStyle(
                                        color: CustomColor.grey, fontSize: 16),
                                    prefixIcon: IconButton(
                                        icon: ImageIcon(
                                          AssetImage(
                                              "assets/image/searchlight.png"),
                                          color: CustomColor.lightgrey,
                                          size: 16,
                                        ),
                                        onPressed: () {}),
                                    filled: true,
                                    fillColor: Color(0xffdadde0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35),
                                      borderSide: BorderSide.none,
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            (filteredList.length == 0)
                                ? const Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      "No Audits available",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: CustomColor.black,
                                          fontSize: 14),
                                    ),
                                  )
                                : SizedBox(),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: filteredList.length,
                                  itemBuilder: (context, index) {
                                    WHLocationTable location =
                                        filteredList[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WHLocationsDetails(
                                                      auditDetails:
                                                          widget.auditDetails,
                                                      location: location,
                                                    )),
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: (location.apiStatus !=
                                                      DB_API_STATUS
                                                          .COMPLETED.name)
                                                  ? Colors.grey
                                                  : Colors.green,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                            color: CustomColor
                                                                .black,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    if (location.apiStatus !=
                                                        DB_API_STATUS
                                                            .COMPLETED.name)
                                                      Row(
                                                        children: [
                                                          GestureDetector(
                                                              onTap: () async {
                                                                await showDialog(
                                                                    context:
                                                                        context,
                                                                    barrierColor:
                                                                        Colors
                                                                            .transparent,
                                                                    builder:
                                                                        (context) {
                                                                      return CreateWHLocationScreen(
                                                                          location:
                                                                              location,
                                                                          auditDetails:
                                                                              widget.auditDetails);
                                                                    });
                                                                updateWHLocations();
                                                              },
                                                              child: Container(
                                                                color: Colors
                                                                    .transparent,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  child: Icon(
                                                                    Icons.edit,
                                                                    color: Colors
                                                                        .blue,
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
                                                                color: Colors
                                                                    .transparent,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  child: Icon(
                                                                    Icons
                                                                        .delete,
                                                                    color: Colors
                                                                        .redAccent,
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              ))
                                                        ],
                                                      ),
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
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Description:   ${location.description}",
                                                  style: const TextStyle(
                                                      color: CustomColor.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Is Active:   ${location.isActive}",
                                                  style: const TextStyle(
                                                      color: CustomColor.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ))
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
      list.sort((a, b) => b.updatedDateAndTime.compareTo(a.updatedDateAndTime));
      filterMainList();
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
    List<WHInOutWardsTable> whInOutList = await DatabaseRepository()
        .getWHInOutWardByLocationId(location.locationId);
    List<WHAuditingTable> whAuditingList = await DatabaseRepository()
        .getWHAuditingByLocationId(location.locationId);
    if (whInOutList.length > 0 || whAuditingList.length > 0) {
      SnackBarUtils.showError(context,
          "Sorry we can't delete this location, Because some auditings or In Out wards are under this location");
    } else {
      await DatabaseRepository().deleteWHLocation(guid: location.locationId);
      updateWHLocations();
    }
    Navigator.pop(context);
  }

  void filterMainList() {
    String? searchQuery = _searchController.text;
    filteredList.clear();
    filteredList.addAll(list.where((e) {
      if (searchQuery.length > 0) {
        bool isItemMatched =
            e.palletNumber.toLowerCase().contains(searchQuery.toLowerCase()) ??
                false;
        return isItemMatched;
      } else {
        return true;
      }
    }));
  }
}
