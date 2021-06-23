import 'dart:math';

import 'package:art_comp/Challenge.dart';
import 'package:art_comp/submission_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

class DetailJoinChallenge extends StatefulWidget {
  const DetailJoinChallenge({Key key}) : super(key: key);

  @override
  _DetailJoinChallengeState createState() => _DetailJoinChallengeState();
}

class _DetailJoinChallengeState extends State<DetailJoinChallenge> {
  @override
  Widget build(BuildContext context) {
    final challenge = ModalRoute.of(context).settings.arguments as Challenge;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Challenge Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              padding: EdgeInsets.fromLTRB(10, 80, 10, 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
              ),
              child: Text(challenge.title, style: TextStyle(fontSize: 25))
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FaIcon(FontAwesomeIcons.clock),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('Start date: ' + challenge.dateStartSubmission),
                    )
                  ],
                )
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FaIcon(FontAwesomeIcons.solidClock),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('End date: ' + challenge.dateEndSubmission),
                    )
                  ],
                )
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FaIcon(FontAwesomeIcons.calendarTimes),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('Announcement date: ' + challenge.dateAnnouncement),
                    )
                  ],
                )
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FaIcon(FontAwesomeIcons.externalLinkAlt),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: TextButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: challenge.furtherDescLink));
                        },
                        child: Text('Further Description')
                      ),
                    ),
                  ],
                )
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Description', style: TextStyle(fontSize: 20)),
                    Text(challenge.desc, style: TextStyle(fontSize: 12))
                  ],
                )
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => {
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => SubmissionPage(),
                          settings: RouteSettings(
                              arguments: challenge,
                          )
                      ))
                    },
                    child: Text(
                      'Add submission',
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
      )
    );
  }
}
