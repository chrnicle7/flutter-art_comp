import 'dart:convert';
import 'dart:math';

import 'package:art_comp/ApiConfig.dart';
import 'package:art_comp/Challenge.dart';
import 'package:art_comp/detail_join_challenge.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class IndexJoinChallenge extends StatefulWidget {
  const IndexJoinChallenge({Key key}) : super(key: key);

  @override
  _IndexJoinChallengeState createState() => _IndexJoinChallengeState();
}

class _IndexJoinChallengeState extends State<IndexJoinChallenge> {
  Future _fetchChallenge() async{
    var url = Uri.parse(ApiConfig.getUrl() + 'challenges');
    var response = await http.get(url);
    var responseDecode = jsonDecode(response.body);
    var datas = responseDecode['data'];

    List<Challenge> challenges = [];

    for(var data in datas){
      Challenge challenge = new Challenge(data['id'], data['title'], data['desc'],
                                      data['date_start_submission'], data['date_end_submission'], data['date_announcement'],
                                      data['id_host'], data['further_desc_link']);
      challenges.add(challenge);
    }

    return challenges;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Challenges'),
        ),
        backgroundColor: Colors.grey[900],
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: FutureBuilder(
            future: this._fetchChallenge(),
            builder: (context, snapshot) {
              if(snapshot.data == null){
                return Container(
                  child: Center(
                    child: Text('Loading...'),
                  ),
                );
              }else{
                return ListView.builder(itemCount: snapshot.data.length,
                    itemBuilder: (context, i){
                      return Card(
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.stop,
                            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                          ),
                          title: Text(snapshot.data[i].title),
                          subtitle: Text(snapshot.data[i].dateStartSubmission + ' until ' + snapshot.data[i].dateEndSubmission),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailJoinChallenge(),
                                settings: RouteSettings(
                                  arguments: snapshot.data[i]
                                )
                              )
                            );
                          },
                        ),
                      );
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}

