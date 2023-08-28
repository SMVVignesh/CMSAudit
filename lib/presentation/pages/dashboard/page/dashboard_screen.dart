import 'package:cms_audit/core/constants/constants.dart';
import 'package:cms_audit/presentation/base/custom_state.dart';
import 'package:cms_audit/presentation/pages/dashboard/model/dashboard_menu_model.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/audit_details/page/audit_details_screen.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/products/page/product_screen.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/update_list/page/update_list_screen.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/upload_data/page/upload_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:tool_kit/tool_kit.dart';

import '../../../../core/utils/custom_color.dart';
import '../../../../core/utils/utils.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends CustomState<DashboardScreen> {
  List<DashboardMenuModel> menus = [];
  DashboardMenuModel? selectedMenu;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget myBuild(BuildContext context) {
    updateDrawerMenus();
    selectedMenu ??= menus[1];
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          selectedMenu?.name ?? "",
        ),
        backgroundColor: CustomColor.toolbarBg,
      ),
      drawer: Container(
          color: CustomColor.white,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            children: [
              Container(
                height: 200,
                color: CustomColor.toolbarBg,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/image/app_icon.png",
                        height: 60,
                        width: 60,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "CMS Audit",
                        style: TextStyle(
                            color: CustomColor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      DashboardMenuModel item = menus[index];
                      return GestureDetector(
                        onTap: () {
                          navigateTo(item);
                        },
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(item.iconData,size: 20,color: CustomColor.toolbarBg,),
                                    const SizedBox(width: 10,),
                                    Expanded(
                                      child: Text(
                                        item.name,
                                        style: const TextStyle(
                                            color: CustomColor.black, fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: double.infinity,
                                height: 0.5,
                                color: CustomColor.textGrey,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: menus.length,
                  ),
                ),
              ),
            ],
          )),
      body: selectedMenu?.screen ?? Container(color: CustomColor.white),
    );
  }

  @override
  String setScreen() {
    return HOME_SCREEN;
  }

  updateDrawerMenus() {
    menus.clear();
    menus.add(DashboardMenuModel(
        id: 1, name: "Products",iconData:Icons.production_quantity_limits, screen: const ProductScreen()));
    menus.add(DashboardMenuModel(
        id: 2, name: "Audits",iconData:Icons.account_balance, screen: const AuditDetailsScreen()));
    menus.add(DashboardMenuModel(
        id: 3, name: "Update Details",iconData:Icons.cloud_download_outlined, screen: const UpdateListScreen()));
    menus.add(DashboardMenuModel(
        id: 5, name: "Upload Data",iconData:Icons.upload_file, screen: const UploadDataScreen()));
    menus.add(DashboardMenuModel(id: 4,iconData:Icons.logout, name: "Logout"));
  }

  void navigateTo(DashboardMenuModel item) {
    if (_scaffoldKey.currentState?.isDrawerOpen == true) {
      _scaffoldKey.currentState?.openEndDrawer();
    }
    if (item.id != 4) {
      setState(() {
        selectedMenu = item;
      });
    } else {
      showConfirmationPopUp();
    }
  }

  void showConfirmationPopUp() {
    DialogUtils.showCustomDialog(
        context: context,
        themeColor: CustomColor.splashScreenTop,
        heading: "Logout",
        desc: "Are you sure you want to Logout?",
        positiveBtn: "Yes",
        positiveClick: () {
          Utils.clearCacheAndNavigateToLogin(context);
        },
        negativeBtn: "No",
        negativeClick: () {
          Navigator.pop(context);
        });
  }
}
