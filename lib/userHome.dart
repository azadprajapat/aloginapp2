import 'package:aasignupapp/Register_page.dart';
import 'package:aasignupapp/_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  Home(Details details);

  HomeState createState() => HomeState();
}

class HomeState extends State<Home>{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Welcome user'),
      ),
      body: BottomAppBar(
        child: Text(this.details.username),
      ),

    );
  }
}

