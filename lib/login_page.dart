import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
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
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            hintText: 'password'),
                      )),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 20),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => {print('submit')},
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
