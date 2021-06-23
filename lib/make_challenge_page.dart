import 'dart:convert';

import 'package:art_comp/ApiConfig.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class MakeChallengePage extends StatefulWidget {
  const MakeChallengePage({Key key}) : super(key: key);

  @override
  _MakeChallengePageState createState() => _MakeChallengePageState();
}

class _MakeChallengePageState extends State<MakeChallengePage> {
  TextEditingController txtTitle = new TextEditingController();
  TextEditingController txtLink = new TextEditingController();
  TextEditingController txtStartSubmit = new TextEditingController();
  TextEditingController txtEndSubmit = new TextEditingController();
  TextEditingController txtAnnouncement = new TextEditingController();
  TextEditingController txtDesc = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd");

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Challenge')
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
                        controller: txtTitle,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: FaIcon(FontAwesomeIcons.font), // myIcon is a 48px-wide widget.
                          ),
                          hintText: 'Title',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: DateTimeField(
                        controller: txtStartSubmit,
                        format: format,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: FaIcon(FontAwesomeIcons.clock), // myIcon is a 48px-wide widget.
                          ),
                          hintText: 'Start submission date',
                        ),
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: DateTimeField(
                        controller: txtEndSubmit,
                        format: format,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: FaIcon(FontAwesomeIcons.solidClock), // myIcon is a 48px-wide widget.
                          ),
                          hintText: 'End submission date',
                        ),
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: DateTimeField(
                        controller: txtAnnouncement,
                        format: format,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: FaIcon(FontAwesomeIcons.calendarTimes), // myIcon is a 48px-wide widget.
                          ),
                          hintText: 'Announcement date',
                        ),
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                      ),
                    ),
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
                          hintText: 'Further more link',
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
                            onPressed: () => {
                              this._doStoreChallenge()
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

  Future _doStoreChallenge() async{
    print(SpUtil.getInt('id_user'));
    if(txtTitle.text.isEmpty || txtStartSubmit.text.isEmpty || txtEndSubmit.text.isEmpty || txtAnnouncement.text.isEmpty ||
       txtLink.text.isEmpty || txtDesc.text.isEmpty) {

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

    var url = Uri.parse(ApiConfig.getUrl() + 'challenge/store');
    final response = await http.post(url, body: {
      'title': txtTitle.text,
      'desc': txtDesc.text,
      'date_start_submission': txtStartSubmit.text,
      'date_end_submission': txtEndSubmit.text,
      'date_announcement': txtAnnouncement.text,
      'id_host': SpUtil.getInt('id_user').toString(),
      'further_desc_link': txtLink.text
    }, headers: {
      'Accept': 'application/json'
    });

    print(response.statusCode);

    if(response.statusCode == 200){
      Alert(
        context: context,
        style: alertStyleSuccess,
        title: "Challenge stored!",
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
        title: "Invalid form!",
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
    }else if(response.statusCode == 404){
      Alert(
        context: context,
        style: alertStyleFailed,
        title: "Something wrong",
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
