import 'package:flutter/material.dart';
import 'package:notetaking_app/AdditemPage.dart';
import 'package:notetaking_app/EditPage.dart';
import 'package:notetaking_app/task_title.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'Page2.dart';
import 'MyHomePage.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
