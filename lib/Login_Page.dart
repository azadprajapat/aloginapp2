import 'package:aasignupapp/Register_page.dart';
import 'package:aasignupapp/_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController username, password;
Details details;
  @override
  void initState() {
    username = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(4.0),
          child: ListView(
            children: <Widget>[
              getassetimage(),
              TextFormField(
                style: TextStyle(
                  fontSize: 15.0,
                ),
                controller: username,
                keyboardType: TextInputType.text,

                decoration: InputDecoration(
                  errorStyle:
                      TextStyle(fontSize: 15.0, color: Colors.yellowAccent),
                  labelText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
              Container(
                height: 20,
              ),
              TextFormField(
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                style: TextStyle(
                  fontSize: 15.0,
                ),
                validator: (String value) {
                  if (value.length < 6) {
                    return 'password too short';
                  }
                  if (value.isEmpty) {
                    return 'please enter password';
                  }
                },
                decoration: InputDecoration(
                  errorStyle:
                      TextStyle(fontSize: 15.0, color: Colors.yellowAccent),
                  labelText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
              Container(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: RaisedButton(
                          padding: EdgeInsets.all(0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                          elevation: 5.0,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red),
                          ),
                          onPressed: () {},
                        )),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: RaisedButton(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        elevation: 5.0,
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red),
                        ),
                        onPressed: () {
                          _gotoregister();
                        },
                      ),
                    ),
                  ),
            ],
          ),
          ]
        )
        )
    );
  }

  Widget getassetimage() {
    AssetImage assetImage = AssetImage('assets/mylogo2.jpg');
    Image image = Image(
      image: assetImage,
      width: 250.0,
      height: 200.0,
    );
    return Container(
      child: image,
      padding: EdgeInsets.only(left: 30.0, top: 10.0),
    );
  }
  void _gotoregister() async{
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register(this.details)),
    );

  }
}
