import 'dart:ffi';
import 'dart:io';
import 'package:aasignupapp/Register_page.dart';
import 'package:aasignupapp/_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '_memberDetails.dart';

class Home extends StatefulWidget {
  final Details details;
  Home(this.details);
  HomeState createState() {
    return HomeState();
  }
}
class HomeState extends State<Home> {
  @override

    Details details;

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome', style: TextStyle(fontSize: 20.0),),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 150,
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                      child: IconButton(icon: Icon(Icons.flight),
                        onPressed: () {},
                        iconSize: 50.0,
                        color: Colors.lightBlueAccent,),),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: IconButton(icon: Icon(Icons.directions_bus),
                        onPressed: () {},
                        iconSize: 50.0,
                        color: Colors.lightBlueAccent,),),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: IconButton(icon: Icon(Icons.business),
                        onPressed: () {},
                        iconSize: 50.0,
                        color: Colors.lightBlueAccent,),),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: IconButton(icon: Icon(Icons.directions_car),
                        onPressed: () {},
                        iconSize: 50.0,
                        color: Colors.lightBlueAccent,),)


                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                      child: IconButton(icon: Icon(Icons.train),
                        onPressed: () {},
                        iconSize: 50.0,
                        color: Colors.lightBlueAccent,),),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: IconButton(icon: Icon(Icons.contact_mail),
                        onPressed: () {},
                        iconSize: 50.0,
                        color: Colors.lightBlueAccent,),),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: IconButton(icon: Icon(Icons.weekend),
                        onPressed: () {},
                        iconSize: 50.0,
                        color: Colors.lightBlueAccent,),),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: IconButton(icon: Icon(Icons.fastfood),
                        onPressed: () {},
                        iconSize: 50.0,
                        color: Colors.lightBlueAccent,),)


                  ],
                )
              ],
            ),

          ),
          RaisedButton(onPressed: () {
            MemberPage();
          },
            child: Text('GetMemberDetails'),
          ),
          RaisedButton(onPressed: () {
            _gotoregister();
          },
            child: Text('Register more'),
          )


        ],

      ),


    );
  }

  void _gotoregister() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register(this.details)),
    );
  }

  void MemberPage() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Member(this.details)),
    );
  }


}