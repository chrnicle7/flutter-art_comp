import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'ApiConfig.dart';
import 'User.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  User user;

  @override
  Widget build(BuildContext context) {
    _getUser() async{
      var url = Uri.parse(ApiConfig.getUrl() + 'user/4');
      var response = await http.get(url);

      if(response.statusCode == 200){
        var responseDecode = jsonDecode(response.body);
        return responseDecode;
      }
    }

    return Container(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Dashboard')
        ),
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                            color: Colors.grey[800],
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
                                  onPressed: () => {
                                    Navigator.pushNamed(context, 'index-join-challenge-page')
                                  },
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
                            color: Colors.grey[800],
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
                          )
                      ),
                      Container(
                          width: 100,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[800],
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
                                  onPressed: () => {
                                    Navigator.pushNamed(context, 'make-challenge-page')
                                  },
                                  icon: FaIcon(FontAwesomeIcons.plus),
                                ),
                              ),
                              Text('Make\nChallenges',
                                  textAlign: TextAlign.center)
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 100,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[800],
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
                            color: Colors.grey[800],
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey,
                                ),
                                child: IconButton(
                                  onPressed: () => {
                                    this._doLogout()
                                  },
                                  icon: FaIcon(FontAwesomeIcons.user),
                                ),
                              ),
                              Text('Logout\n', textAlign: TextAlign.center)
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 10),
                  child: Text('User Statistics', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                FutureBuilder(
                  future: _getUser(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      var data = snapshot.data['data'];
                      User user = User(
                          data['id'],
                          data['name'],
                          data['email'],
                          data['exp'],
                          data['count_gold_medal'],
                          data['count_silver_medal'],
                          data['count_bronze_medal'],
                          data['count_challenges_joined'],
                          data['count_challenges_hosted']
                      );

                      return Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 5,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width * 0.40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.deepPurple,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            FaIcon(FontAwesomeIcons.running, size: 12),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text('Challenge Joined', style: TextStyle(fontSize: 12)),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Text(user.countChallengesJoined.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                        )
                                      ],
                                    )
                                ),
                                Container(
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width * 0.40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.blue,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            FaIcon(FontAwesomeIcons.folderPlus, size: 12),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text('Challenge Hosted', style: TextStyle(fontSize: 12)),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Text(user.countChallengesHosted.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                        )
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width * 0.40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            FaIcon(FontAwesomeIcons.starHalfAlt, size: 12),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text('Exp', style: TextStyle(fontSize: 12)),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Text(user.exp.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                        )
                                      ],
                                    )
                                ),
                                Container(
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width * 0.40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.orangeAccent,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            FaIcon(FontAwesomeIcons.medal, size: 12),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text('Gold Medal', style: TextStyle(fontSize: 12)),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Text(user.countGoldMedal.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                        )
                                      ],
                                    )
                                ),

                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width * 0.40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.blueGrey[600],
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            FaIcon(FontAwesomeIcons.medal, size: 12),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text('Silver Medal', style: TextStyle(fontSize: 12)),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Text(user.countSilverMedal.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                        )
                                      ],
                                    )
                                ),
                                Container(
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width * 0.40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.deepOrange,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            FaIcon(FontAwesomeIcons.medal, size: 12),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text('Bronze Medal', style: TextStyle(fontSize: 12)),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Text(user.countBronzeMedal.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                        )
                                      ],
                                    )
                                ),

                              ],
                            ),
                          )
                        ],
                      );
                    }
                    else{
                      return Center(
                        child: Text('Loading...'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _doLogout() async{
    SpUtil.clear();
    Navigator.pushReplacementNamed(context, 'login-page');
  }
}
