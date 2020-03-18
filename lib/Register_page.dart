import 'package:aasignupapp/Login_Page.dart';
import 'package:aasignupapp/_details.dart';
import 'package:aasignupapp/userHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class Register extends StatefulWidget {
  final Details details;
  Register(this.details);

  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  DatabaseHelper helper = DatabaseHelper();
  Details details;
  var _FormKey;
  TextEditingController _mobile;
  TextEditingController _email;
  TextEditingController _username;
  TextEditingController _password;

  void initState() {

    _mobile = TextEditingController();
    _email = TextEditingController();
    _username = TextEditingController();
    _password = TextEditingController();
    _FormKey =GlobalKey<FormState>();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(4.0),
        child: Form(
          key: _FormKey,
          child: ListView(
            children: <Widget>[
              LoginPageState().getassetimage(),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: TextFormField(
                  style: TextStyle(fontSize: 15.0),
                  controller:  _username,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        fontSize: 15.0,
                    ),
                    labelText: 'username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  validator: (String value ){
                    if(value.isEmpty){
                      return 'Please enter username';

                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: TextFormField(
                  style: TextStyle(fontSize: 15.0),
                  controller: _mobile,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        fontSize: 15.0,
                    ),
                    labelText: 'Mobile number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  validator: (String value ){
                    if(value.isEmpty){
                      return 'Please enter mobile number';

                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: TextFormField(
                  style: TextStyle(fontSize: 15.0),
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        fontSize: 15.0,
                    ),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  validator: (String value ){
                    if(value.isEmpty){
                      return 'Please enter email';

                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: TextFormField(
                  style: TextStyle(fontSize: 15.0),
                  controller: _password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        fontSize: 15.0,
                    ),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  validator: (String value ){
                    if(value.isEmpty){
                      return 'Please enter a password to set';

                    }
                  },
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
                            'Back',
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
                          onPressed: () async{
                            var  result=Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                          },
                        )),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: RaisedButton(
                        child: Text(
                          'Next',
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
                          setState(() {
                            if (_FormKey.currentState.validate()) {
                              _save();
                              gotoHome();
                            }

                          });


                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
   void _save() async {

         int result;
      result = await helper.insertDetail(details);

  }

void gotoHome()  async {
  var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home(details)));
}
}

