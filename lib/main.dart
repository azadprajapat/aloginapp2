import 'package:aasignupapp/Register_page.dart';
import 'package:aasignupapp/_details.dart';
import 'package:aasignupapp/userHome.dart';
import 'package:flutter/material.dart';
import 'package:aasignupapp/Login_Page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prajapat travel agency',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginPage(),
    );
  }
}