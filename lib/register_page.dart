import 'package:art_comp/ApiConfig.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController regName = new TextEditingController();
  TextEditingController regEmail = new TextEditingController();
  TextEditingController regPwd = new TextEditingController();
  TextEditingController regConfPwd = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Register',
                style: TextStyle(fontSize: 30, color: Colors.teal[300]),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 5),
                    child: TextFormField(
                      controller: regName,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 30),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          hintText: 'Username'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 5),
                    child: TextFormField(
                      controller: regEmail,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 30),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          hintText: 'Email'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 5),
                    child: TextFormField(
                      controller: regPwd,
                      obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 30),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          hintText: 'Password'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 5),
                    child: TextFormField(
                      controller: regConfPwd,
                      obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 30),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          hintText: 'Password confirmation'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => {
                            this._doRegister()
                          },
                          child: Text(
                            'REGISTER',
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.teal[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 20),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'login-page');
                      },
                      child: Text(
                        'or Login',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _doRegister() async{
    if(regName.text.isEmpty || regEmail.text.isEmpty || regPwd.text.isEmpty || regConfPwd.text.isEmpty){
      var alertStyleEmpty = AlertStyle(
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );

      Alert(
        context: context,
        style: alertStyleEmpty,
        title: "Form still empty!",
        buttons: [
          DialogButton(
            child: Text(
              "Close",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color.fromRGBO(0, 179, 134, 1.0),
            radius: BorderRadius.circular(0.0),
          ),
        ],
      ).show();

      return;
    }

    var alertStyleSuccess = AlertStyle(
      titleStyle: TextStyle(
        color: Colors.lightGreen,
      ),
    );

    var alertStyleFailed = AlertStyle(
      titleStyle: TextStyle(
        color: Colors.redAccent,
      ),
    );

    var url = Uri.parse(ApiConfig.getUrl() + 'register');
    final response = await http.post(url, body: {
      'name': regName.text,
      'email': regEmail.text,
      'password': regPwd.text,
      'password_confirmation': regConfPwd.text,
    }, headers: {
      'Accept': 'application/json'
    });

    if(response.statusCode == 201){
      Alert(
        context: context,
        style: alertStyleSuccess,
        title: "Register success!",
        buttons: [
          DialogButton(
            child: Text(
              "Close",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color.fromRGBO(0, 179, 134, 1.0),
            radius: BorderRadius.circular(0.0),
          ),
        ],

      ).show();

      Navigator.pushNamed(context, 'login-page');
    }else if(response.statusCode == 403){
      Alert(
        context: context,
        style: alertStyleFailed,
        title: "Invalid registration form!",
        buttons: [
          DialogButton(
            child: Text(
              "Close",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color.fromRGBO(0, 179, 134, 1.0),
            radius: BorderRadius.circular(0.0),
          ),
        ],
      ).show();
    }
  }
}
