// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cms_audit/main.dart';

void main() {
test("test", ()  {
  String encode = jsonEncode(["dupilumab@REGN668_IL-4R^anti-IL-4R!Ab_IIGI"]);
  print("encode : $encode");
  List<dynamic> decode = jsonDecode(encode);
  print("decode : $decode");
  expect(true, true);
});
}
