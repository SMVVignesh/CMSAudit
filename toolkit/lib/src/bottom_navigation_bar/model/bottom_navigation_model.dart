import 'package:flutter/material.dart';
/*
This model class for the bottom navigation widget
 */
class BottomNavigationModel {
  int id;
  String title;
  String heading;
  String icon;
  String activeIcon;
  int? notificationCount;
  Widget screen;

  BottomNavigationModel({required this.id, required this.title,required this.heading, required this.icon,required this.activeIcon,required this.screen,this.notificationCount});
}
