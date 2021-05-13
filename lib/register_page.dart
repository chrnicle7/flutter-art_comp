import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
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
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 30),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          hintText: 'First Name'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 5),
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 30),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          hintText: 'Last Name'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 5),
                    child: TextFormField(
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
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 20),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => {print('submit')},
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
