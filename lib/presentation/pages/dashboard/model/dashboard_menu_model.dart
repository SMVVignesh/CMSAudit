import 'package:flutter/cupertino.dart';

class DashboardMenuModel{
  int id;
  String name;
  Widget? screen;
  IconData? iconData;
  DashboardMenuModel({required this.id, required this.name,required this.iconData, this.screen});
}