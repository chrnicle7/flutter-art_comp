import 'dart:convert';

import 'package:art_comp/ApiConfig.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sp_util/sp_util.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginEmail = new TextEditingController();
  TextEditingController loginPwd = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 50, color: Colors.teal[300]),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: TextFormField(
                      controller: loginEmail,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          hintText: 'email'),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: TextFormField(
                        controller: loginPwd,
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            hintText: 'password'),
                      )),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => {
                            this._doLogin()
                          },
                          child: Text(
                            'LOGIN',
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
                          Navigator.pushReplacementNamed(context, 'register-page');
                        },
                      child: Text(
                        'or Register',
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

  Future _doLogin() async{
    if(loginEmail.text.isEmpty || loginPwd.text.isEmpty){
      var alertStyleEmpty = AlertStyle(
        titleStyle: TextStyle(
          color: Colors.red,
        ),
      );

      Alert(
        context: context,
        style: alertStyleEmpty,
        title: "Empty email or password!",
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

    var url = Uri.parse(ApiConfig.getUrl() + 'login');
    final response = await http.post(url, body: {
      'email': loginEmail.text,
      'password': loginPwd.text,
    }, headers: {
      'Accept': 'application/json'
    });

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

    if(response.statusCode == 200){
      var responseDecode = jsonDecode(response.body);
      var data = responseDecode['data'];
      var user = data['user'];
      SpUtil.putInt("id_user", user['id']);

      Navigator.pushReplacementNamed(context, 'dashboard-page');
    }else{
      Alert(
        context: context,
        style: alertStyleFailed,
        title: "Login failed!",
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
