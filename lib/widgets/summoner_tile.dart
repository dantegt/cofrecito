import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class SummonerTile extends StatelessWidget {
  const SummonerTile(
      {super.key, this.summoner, this.level, required this.rankedData, this.icon});

  final String? summoner;
  final int? level;
  final Map<String, dynamic> rankedData;
  final String? icon;


  @override
  Widget build(BuildContext context) {
    var rank = rankedData['tier'];
    var division = rankedData['rank'];

    return ListTile(
      tileColor: Theme.of(context).bottomAppBarColor,
      title: Text(
        summoner == '' ? 'Summoner' : summoner.toString(),
        style: const TextStyle(
            fontSize: 18, fontFamily: 'Beaufort', fontWeight: FontWeight.w800),
      ),
      leading: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
        icon == '' ? _randomIcon() : icon,
      )),
      trailing: Wrap(
        children: [
          CachedNetworkImage(
            imageUrl: _rankIcon(rank, division),
            width: 70,
            height: 60,
          ),
        ],
      ),
      subtitle: Text(level == 0 ? 'Nivel ${_randomRank()}' : 'Nivel $level',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            fontFamily: 'Beaufort',
            color: Theme.of(context).primaryColorLight,
          )),
    );
  }
}

_randomIcon() {
  var num = Random().nextInt(99);
  return 'https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/profile-icons/54$num.jpg';
}

_randomRank() {
  return Random().nextInt(500);
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