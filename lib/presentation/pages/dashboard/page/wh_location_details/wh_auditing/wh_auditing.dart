import 'package:cms_audit/core/utils/custom_color.dart';
import 'package:cms_audit/domain/local_data_base/database.dart';
import 'package:cms_audit/presentation/base/custom_state.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/audit_details/model/audit_response.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/wh_location_details/wh_auditing/create_wh_auditing.dart';
import 'package:flutter/material.dart';
import 'package:tool_kit/tool_kit.dart';

import '../../../../../../core/utils/db_api_status.dart';
import '../../../../../../domain/local_data_base/data_base_repository.dart';

class WHAuditingScreen extends StatefulWidget {
  Data auditDetails;
  WHLocationTable location;

  WHAuditingScreen(
      {super.key, required this.auditDetails, required this.location});

  @override
  State<WHAuditingScreen> createState() => _WHAuditingScreenState();
}

class _WHAuditingScreenState extends CustomState<WHAuditingScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<WHAuditingTable> list = [];
  List<WHAuditingTable> filteredList = [];

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
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 8, right: 8),
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
                      hintStyle:
                      TextStyle(color: CustomColor.grey, fontSize: 16),
                      prefixIcon: IconButton(
                          icon: ImageIcon(
                            AssetImage("assets/image/searchlight.png"),
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
              Expanded(
                  child: (filteredList.length == 0)
                      ? const Center(
                          child: Text(
                            "No Audit available",
                            style: TextStyle(
                                color: CustomColor.black, fontSize: 14),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            WHAuditingTable inOutWard = filteredList[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: (inOutWard.apiStatus !=
                                        DB_API_STATUS
                                            .COMPLETED.name)
                                        ? Colors.grey
                                        : Colors.green,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                          if (inOutWard.apiStatus !=
                                              DB_API_STATUS.COMPLETED.name)
                                            Row(
                                              children: [
                                                GestureDetector(
                                                    onTap: () async {
                                                      await showDialog(
                                                          context: context,
                                                          barrierColor: Colors
                                                              .transparent,
                                                          builder: (context) {
                                                            return CreateWHAuditingScreen(
                                                              location: widget
                                                                  .location,
                                                              auditDetails: widget
                                                                  .auditDetails,
                                                              auditingTable:
                                                                  inOutWard,
                                                            );
                                                          });
                                                      updateWHInOutWardsScreen();
                                                    },
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
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
                                                          inOutWard);
                                                    },
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: Icon(
                                                          Icons.delete,
                                                          color:
                                                              Colors.redAccent,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            )
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
      list.sort((a, b) => b.updatedDateAndTime.compareTo(a.updatedDateAndTime));
      filterMainList();
      setState(() {});
    });
  }

  void filterMainList() {
    String? searchQuery = _searchController.text;
    filteredList.clear();
    filteredList.addAll(list.where((e) {
      if (searchQuery.length > 0) {
        bool isItemMatched =
            e.productName.toLowerCase().contains(searchQuery.toLowerCase()) ?? false;
        return isItemMatched;
      } else {
        return true;
      }
    }));
  }

  void showDeleteConfirmationPopUp(WHAuditingTable auditingTable) {
    DialogUtils.showCustomDialog(
        context: context,
        themeColor: CustomColor.splashScreenTop,
        heading: "",
        desc:
            "Are you sure you want to Delete Id: ${auditingTable.auditingId}?",
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
