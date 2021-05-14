import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 60, 30, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        width: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey[700],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                              ),
                              child: IconButton(
                                onPressed: () => {print("zz")},
                                icon: FaIcon(FontAwesomeIcons.paintBrush),
                              ),
                            ),
                            Text('Join\nChallenges',
                                textAlign: TextAlign.center)
                          ],
                        )),
                    Container(
                        width: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey[700],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber[900],
                              ),
                              child: IconButton(
                                onPressed: () => {print("zz")},
                                icon: FaIcon(FontAwesomeIcons.folderOpen),
                              ),
                            ),
                            Text('My\nChallenges', textAlign: TextAlign.center)
                          ],
                        )),
                    Container(
                        width: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey[700],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green[600],
                              ),
                              child: IconButton(
                                onPressed: () => {print("zz")},
                                icon: FaIcon(FontAwesomeIcons.search),
                              ),
                            ),
                            Text('Explore\nChallenges',
                                textAlign: TextAlign.center)
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        width: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey[700],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightBlue[800],
                              ),
                              child: IconButton(
                                onPressed: () => {print("zz")},
                                icon: FaIcon(FontAwesomeIcons.plus),
                              ),
                            ),
                            Text('Make\nChallenges',
                                textAlign: TextAlign.center)
                          ],
                        )),
                    Container(
                        width: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey[700],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.indigo[400],
                              ),
                              child: IconButton(
                                onPressed: () => {print("zz")},
                                icon: FaIcon(FontAwesomeIcons.folderPlus),
                              ),
                            ),
                            Text('Hosted\nChallenges',
                                textAlign: TextAlign.center)
                          ],
                        )),
                    Container(
                        width: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey[700],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.cyan[600],
                              ),
                              child: IconButton(
                                onPressed: () => {print("zz")},
                                icon: FaIcon(FontAwesomeIcons.user),
                              ),
                            ),
                            Text('Edit\nProfile', textAlign: TextAlign.center)
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
