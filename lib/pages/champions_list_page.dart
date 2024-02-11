import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_app/shared/preferences.dart';
import 'package:flutter_app/widgets/summoner_tile.dart';

import '../widgets/widgets.dart';

class ChampionsListPage extends StatelessWidget {
  ChampionsListPage({super.key});
  final rankedData = jsonDecode(Preferences.rankedData);

  Future fetchMasteries() async {
    final server = Preferences.server;
    final puuid = Preferences.summonerPuuid;
    final response = await http.get(Uri.parse('https://lolcito-express.onrender.com/api/v1/masteries/$server/$puuid'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final String icon = Preferences.icon.toString();
    final String iconImageURL = 'https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/profile-icons/$icon.jpg';

    return Scaffold(
      appBar: AppBar(
        title: const Text('COFRECITO',
            style:
                TextStyle(fontFamily: 'Beaufort', fontWeight: FontWeight.w800)),
      ),
      drawer: const DrawerMenu(),
      body: FutureBuilder(
        future: fetchMasteries(),
          builder: (context, snapshot) {
            var champions = json.decode(snapshot.data.toString());

            return Column(
              children: [
                SummonerTile(
                    summoner: Preferences.summoner,
                    level: Preferences.level,
                    rankedData: jsonDecode(Preferences.rankedData),
                    icon: iconImageURL),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    // shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ChampionTile(
                        name: champions[index]['name'],
                        champId: champions[index]['key'],
                        description: champions[index]['title'],
                        mastery: champions[index]['mastery']['championLevel'].toString(),
                        chestGranted: champions[index]['chestGranted'],
                        champion: champions[index]
                      );
                    },
                    itemCount: champions == null ? 0 : champions.length,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
