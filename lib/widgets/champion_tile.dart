import 'dart:math';

import 'package:flutter/material.dart';
import '../shared/constants.dart';

class ChampionTile extends StatelessWidget {
  ChampionTile({super.key, this.name, this.champId, this.description});

  final String? name;
  final String? champId;
  final String? description;
  final mastery = _randomMastery();
  final hasChest = _hasChest();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name ?? 'Champion name',
        style: const TextStyle(
            fontSize: 18, fontFamily: 'Beaufort', fontWeight: FontWeight.w800),
      ),
      leading: Wrap(
        children: [
          CircleAvatar(backgroundImage: AssetImage(hasChest)),
          const SizedBox(width: 5),
          CircleAvatar(
            backgroundImage: _getImage(champId),
          ),
        ],
      ),
      trailing: Wrap(
        children: [
          Image.network(
            _masteryIcon(mastery),
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 5),
          SizedBox(
            height: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: <Widget>[
                    Text(
                      mastery,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Beaufort',
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Colors.white,
                      ),
                    ),
                    Text(mastery,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Beaufort',
                          color: Colors.amber,
                        )),
                  ],
                ),
              ],
            ),
          )
          // CircleAvatar(
          //     backgroundColor: Theme.of(context).primaryColor,
          //     child: ),
        ],
      ),
      subtitle: Text(description ?? 'The champion description',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontFamily: 'Beaufort',
            color: Theme.of(context).backgroundColor,
          )),
    );
  }
}

_getImage(String? champId) {
  return champId == null
      ? Image.asset('assets/images/champion_512x512.jpg')
      : NetworkImage('${Constants.cdn}/champion/$champId/square');
}

_randomMastery() {
  return Random().nextInt(8).toString();
}

_masteryIcon(mastery) {
  String value;
  switch (mastery) {
    case '0':
      value = 'default';
      break;
    case '1':
    case '2':
    case '3':
    case '4':
      value = '4';
      break;
    case '5':
    case '6':
    case '7':
      value = mastery;
      break;
    default:
      value = 'default';
      break;
  }

  return 'https://raw.communitydragon.org/latest/game/assets/ux/mastery/mastery_icon_$value.png';
}

_hasChest() {
  return Random().nextBool()
      ? 'assets/images/cofre-hextech.png'
      : 'assets/images/no-cofre.jpg';
}
