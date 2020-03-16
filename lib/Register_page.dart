import 'package:aasignupapp/Login_Page.dart';
import 'package:aasignupapp/_details.dart';
import 'package:aasignupapp/userHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Details details;
  Register(this.details);

  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  Details details;
  TextEditingController _mobile;
  TextEditingController _email;
  TextEditingController _username;
  TextEditingController _password;

  void initState() {

    _mobile = TextEditingController();
    _email = TextEditingController();
    _username = TextEditingController();
    _password = TextEditingController();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(4.0),
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
                  labelText: 'username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextFormField(
                style: TextStyle(fontSize: 15.0),
                controller: _mobile,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Mobile number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextFormField(
                style: TextStyle(fontSize: 15.0),
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextFormField(
                style: TextStyle(fontSize: 15.0),
                controller: _password,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
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
                          if (widget.details == null) {
                            details = Details(_mobile.text, _username.text, _email.text,_password.text );
                          } else {
                            details = Details.withId(widget.details.mobile,  _username.text, _email.text,_password.text);
                          }
                          GotoHome(details);

                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  void GotoHome( Details details) async{

      var result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home(this.details)),
      );


}
}
