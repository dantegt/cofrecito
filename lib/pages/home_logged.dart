import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:cofrecito/shared/preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../widgets/widgets.dart';
import '../shared/constants.dart';

class HomeLogged extends StatelessWidget {
  const HomeLogged({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String _summoner = Preferences.summoner;
    String _summonerPuuid = Preferences.summonerPuuid;
    int _level = Preferences.level;
    String _icon = Preferences.icon.toString();
    String _rank = Preferences.rank;
    String _iconImageURL = 'https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/profile-icons/$_icon.jpg';

    var rankedData = jsonDecode(Preferences.rankedData);

    var rank = rankedData['tier'];
    var division = rankedData['rank'];
    var wins = rankedData['wins'];
    var losses = rankedData['losses'];
    var winRate = (wins + losses) > 0 ? (wins / (wins + losses) * 100).ceil() : 0;

    return Scaffold(
        appBar: AppBar(
          title: const Text('COFRECITO',
              style: TextStyle(
                  fontFamily: 'Beaufort', fontWeight: FontWeight.w800)),
          elevation: 10.0,
        ),
        drawer: const DrawerMenu(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                SizedBox(
                  width: (1 / 3 * width) - 25,
                  height: 140,
                  child: Stack(children: [
                    ClipOval(
                      child: FadeInImage(
                        image: CachedNetworkImageProvider(_icon != '' ? _iconImageURL : Constants.fallbackIcon),
                        placeholder: const AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 95,
                      left: 30,
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          width: 50,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).backgroundColor,
                          ),
                          child: Text(
                            _level == 0
                                ? '0'
                                : _level.toString(),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ]),
                ),
                SizedBox(
                  width: 1000,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Text(
                              _summoner == ''
                                  ? 'Invocador'
                                  : _summoner,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            color: Colors.transparent,
                            child: Text(
                              _rank == '' ?
                              "UNRANKED"
                              : _rank,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          CachedNetworkImage(
                            imageUrl: _rankIcon(rank, division),
                            width: 500,
                            height: 80,
                          ),
                          if (rank != 'UNRANKED') Wrap(
                            spacing: 20,
                            children: [
                            Column(children: [
                              Text('$wins'),
                              const Text('WINS'),
                            ],),
                            Column(children: [
                              Text('$winRate%'),
                              const Text('WIN RATE'),
                            ],),
                            Column(children: [
                              Text('$losses'),
                              const Text('LOSE'),
                            ],),
                          ],)
                        ]),
                  ),
                ),        
          ]),
          const SizedBox(height: 40,width: double.infinity),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(300, 50),
              backgroundColor: const Color.fromRGBO(174, 145, 75, 1),
            ),
            onPressed: (){Navigator.pushReplacementNamed(context, 'champions');},
            child: const Text('VER MAESTRIAS')
            ),
          const Expanded(child: Text('')),
          const SizedBox(height: 60,width: double.infinity),
              OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(300, 50),
              foregroundColor: const Color.fromRGBO(174, 145, 75, 1),
            ),
            onPressed: (){Navigator.pushReplacementNamed(context, 'home');},
            child: const Text('Buscar otro invocador')
            ),
          ],

        ),
      ));
  }
}

refreshSummonerStats() async {
  final server = Preferences.server;
  final summoner = Preferences.summoner;
  var url = 'https://lolcito-express.onrender.com/api/v1/summoner/$server/$summoner';
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body) as Map<String, dynamic>;
  debugPrint('########### JSON: $json');
  return json;
}

_rankIcon(rankLabel, divisionLabel) {
  final ranks = {
    'IRON': '01_iron',
    'BRONZE': '02_bronze',
    'SILVER': '03_silver',
    'GOLD': '04_gold',
    'PLATINUM': '05_platinum',
    'DIAMOND': '06_diamond',
    'MASTER': '07_master',
    'GRANDMASTER': '08_grandmaster',
    'CHALLENGER': '09_challenger',
    'EMERALD': 'emerald',
  };

  final divisions = {
    'I': 'division1',
    'II': 'division2',
    'III': 'division3',
    'IV': 'division4',
  };

  var rank = ranks[rankLabel];
  var division = divisions[divisionLabel];

  if(rankLabel == 'EMERALD') {
    return 'https://raw.communitydragon.org/latest/game/assets/loadouts/regalia/crests/ranked/05_platinum/05_platinum_division1.png';
  } else if(rankLabel == 'MASTER' || rankLabel == 'GRANDMASTER' || rankLabel == 'CHALLENGER') {
    return 'https://raw.communitydragon.org/latest/game/assets/loadouts/regalia/crests/ranked/$rank/$rank''_division1.png';
  } else if(rankLabel == 'UNRANKED') {
    return 'https://raw.communitydragon.org/latest/game/assets/loadouts/regalia/crests/ranked/01_iron/01_iron_division4.png';
  } else {
    return 'https://raw.communitydragon.org/latest/game/assets/loadouts/regalia/crests/ranked/$rank/$rank''_$division.png';
  }
}
