import 'package:cms_audit/core/utils/custom_color.dart';
import 'package:cms_audit/domain/local_data_base/database.dart';
import 'package:cms_audit/presentation/base/custom_state.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/audit_details/model/audit_response.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/wh_location_details/wh_auditing/wh_auditing.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/wh_location_details/wh_in_out_wards/wh_in_out_wards_screen.dart';
import 'package:flutter/material.dart';
import 'package:tool_kit/tool_kit.dart';
import '../../../../../domain/local_data_base/data_base_repository.dart';

class WHLocationsDetails extends StatefulWidget {
  Data auditDetails;
  WHLocationTable location;

  WHLocationsDetails(
      {super.key, required this.auditDetails, required this.location});

  @override
  State<WHLocationsDetails> createState() => _WHLocationsDetailsState();
}

class _WHLocationsDetailsState extends CustomState<WHLocationsDetails>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    updateTabs();
    super.initState();
    _tabController = TabController(
        length: tabs.length, vsync: this, initialIndex: currentIndex);
    _tabController?.addListener(() {
      setState(() {
        currentIndex = _tabController?.index ?? 0;
      });
    });
  }

  updateTabs() {
    tabs.add(TabModel(
      index: 0,
      heading: "Auditings",
    ));
    tabs.add(TabModel(
      index: 1,
      heading: "In Out Wards",
    ));
  }

  @override
  Widget myBuild(BuildContext context) {
    return Container(
      color: CustomColor.toolbarBg,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: CustomColor.appBG,
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
                    "Audit & Location details:",
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
              getAuditDetails(widget.auditDetails, widget.location),
              const SizedBox(
                height: 10,
              ),
              getVersionUi(),
              Expanded(child: showDetailsScreen())
            ],
          ),
        ),
      )),
    );
  }

  Widget getAuditDetails(Data item, WHLocationTable location) {
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
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Location:    ${location.locationName}",
              style: const TextStyle(
                  color: CustomColor.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
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
          ],
        ),
      ),
    );
  }

  @override
  String setScreen() {
    return "WHLocation";
  }

  int currentIndex = 0;

  List<TabModel> tabs = [];

  Widget getVersionUi() {
    List<Widget> tabsWidget = [];
    tabs.asMap().forEach((index, item) {
      tabsWidget.add(Container(
        decoration: BoxDecoration(
            color: (index == currentIndex)
                ? CustomColor.toolbarBg
                : CustomColor.white,
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                item.heading,
                style: TextStyle(
                    color: (index == currentIndex)
                        ? CustomColor.white
                        : CustomColor.toolbarBg,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ));
    });
    return Container(
      decoration: BoxDecoration(
          color: CustomColor.grey, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: CustomColor.white, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: TabBar(
              labelPadding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              indicatorWeight: double.minPositive,
              indicatorColor: Colors.transparent,
              controller: _tabController,
              isScrollable: false,
              tabs: tabsWidget,
            ),
          ),
        ),
      ),
    );
  }

  Widget showDetailsScreen() {
    switch (currentIndex) {
      case 0:
        return WHAuditingScreen(
            auditDetails: widget.auditDetails, location: widget.location);
      default:
        return WHInOutWardsScreen(
            auditDetails: widget.auditDetails, location: widget.location);
    }
  }
}

class TabModel {
  int index;
  String heading;

  TabModel({required this.index, required this.heading});
}
