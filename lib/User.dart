import 'dart:convert';
import 'package:http/http.dart' as http;

import 'ApiConfig.dart';

class User{
  int id, exp, countGoldMedal, countSilverMedal, countBronzeMedal, countChallengesJoined, countChallengesHosted;
  String name, email;

  User(this.id, this.name, this.email,
      this.exp, this.countGoldMedal, this.countSilverMedal,
      this.countBronzeMedal, this.countChallengesJoined, this.countChallengesHosted);

  static Future<User> connectToApi(int id) async{
    var url = Uri.parse(ApiConfig.getUrl() + 'user/' + id.toString());
    var response = await http.get(url);

    if(response.statusCode == 200){
      var responseDecode = jsonDecode(response.body);
      var data = responseDecode['data'];

      return User(
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
    }

    return null;
  }
}