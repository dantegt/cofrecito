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
      leading: Row(
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
          CircleAvatar(
              backgroundImage: const AssetImage('assets/images/background.png'),
              child: Stack(
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
              )),
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

_hasChest() {
  return Random().nextBool()
      ? 'assets/images/cofre-hextech.png'
      : 'assets/images/no-cofre.jpg';
}
