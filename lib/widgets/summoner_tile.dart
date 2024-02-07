import 'dart:math';

import 'package:flutter/material.dart';

class SummonerTile extends StatelessWidget {
  const SummonerTile(
      {super.key, this.summoner, this.level, this.rank, this.icon});

  final String? summoner;
  final int? level;
  final String? rank;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).bottomAppBarColor,
      title: Text(
        summoner == '' ? 'Summoner' : summoner.toString(),
        style: const TextStyle(
            fontSize: 18, fontFamily: 'Beaufort', fontWeight: FontWeight.w800),
      ),
      leading: CircleAvatar(
          backgroundImage: NetworkImage(
        icon == '' ? _randomIcon() : icon,
      )),
      trailing: Wrap(
        children: [
          Image.network(
            'https://raw.communitydragon.org/latest/game/assets/loadouts/regalia/crests/ranked/05_platinum/05_platinum_division1.png',
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
