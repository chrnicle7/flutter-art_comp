import 'dart:convert';

import 'package:art_comp/ApiConfig.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';

import 'Challenge.dart';

class SubmissionPage extends StatefulWidget {
  const SubmissionPage({Key key}) : super(key: key);

  @override
  _SubmissionPageState createState() => _SubmissionPageState();
}

class _SubmissionPageState extends State<SubmissionPage> {
  TextEditingController txtLink = new TextEditingController();
  TextEditingController txtDesc = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final challenge = ModalRoute.of(context).settings.arguments as Challenge;

    return Container(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Add Submission')
        ),
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        controller: txtLink,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: FaIcon(FontAwesomeIcons.link), // myIcon is a 48px-wide widget.
                          ),
                          hintText: 'Submission Link',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        controller: txtDesc,
                        minLines: 2,
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: 'Description',
                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 50, 25, 0),
                      child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              this._doStoreSubmission(challenge.id);
                            },
                            child: Text(
                              'CREATE',
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.teal[400],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _doStoreSubmission(challengeId) async{
    print(SpUtil.getInt('id_user'));
    if(txtLink.text.isEmpty || txtDesc.text.isEmpty) {

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

    var url = Uri.parse(ApiConfig.getUrl() + 'submission/store');
    final response = await http.post(url, body: {
      'id_challenge': challengeId.toString(),
      'id_user': SpUtil.getInt('id_user').toString(),
      'link': txtLink.text,
      'desc': txtDesc.text,
    }, headers: {
      'Accept': 'application/json'
    });

    if(response.statusCode == 200){
      Alert(
        context: context,
        style: alertStyleSuccess,
        title: "Submission stored!",
        buttons: [
          DialogButton(
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color.fromRGBO(0, 179, 134, 1.0),
            radius: BorderRadius.circular(0.0),
          ),
        ],

      ).show();

    }else if(response.statusCode == 403){
      Alert(
        context: context,
        style: alertStyleFailed,
        title: "Invalid Submission!",
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
