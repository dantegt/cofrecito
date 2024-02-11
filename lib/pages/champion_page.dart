import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer_menu.dart';

class ChampionPage extends StatelessWidget {
  const ChampionPage({super.key, required this.champion});

  final Map<String, dynamic> champion;

@override
Widget build(BuildContext context) {
  final description = champion['title'];
  final mastery = champion['mastery']['championLevel'];
  final tags = champion['tags'];
  final chestGranted = champion['chestGranted'];
  final nextLevelPoints = champion['mastery']['championPointsUntilNextLevel'].toString();
  final tokens = champion['mastery']['championPointsUntilNextLevel'];
  final totalTokens = mastery == 5 ? '2' : mastery == 6 ? '3' : '';
  final championPoints = champion['mastery']['championPoints'];

  return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('COFRECITO',
            style: TextStyle(
                fontFamily: 'Beaufort', fontWeight: FontWeight.w800)),
        elevation: 10.0,
      ),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
            children:[
              //Text(champion.toString()),
          const SizedBox(width: 5555),
          CircleAvatar(
            backgroundImage: _getImage(champion['key']),
            radius: 70
          ),
          const SizedBox(height: 10),
          Text(champion['name'] != '' ? champion['name'] :'New Champion!',
          style: const TextStyle(
              fontFamily: 'Beaufort', fontWeight: FontWeight.w800, fontSize: 25)),
          Text(description ?? 'The champion description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                fontFamily: 'Beaufort',
                color: Theme.of(context).colorScheme.background,
              )),
          Wrap(
            spacing: 10,
            children: List<Widget>.generate(
                tags.length,
                    (int index) {
                return Chip(
                label: Text(tags[index]),
                );
              })
          ),
          const SizedBox(height: 20),
          Wrap(
            children: [
              CachedNetworkImage(
                imageUrl: _masteryIcon(mastery.toString()),
                width: 80,
                height: 80,
              ),
              const SizedBox(width: 5),
              SizedBox(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: <Widget>[
                        Text(
                          mastery.toString(),
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Beaufort',
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 1
                              ..color = Colors.white,
                          ),
                        ),
                        Text(
                            mastery.toString(),
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Beaufort',
                              color: Colors.amber,
                            )),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Text(mastery < 5 ? '$nextLevelPoints PUNTOS PARA PROXIMO NIVEL' :
          mastery == 7 ? 'MAESTRIA MÁXIMA' : '$tokens / $totalTokens TOKENS OBTENIDOS',
                style: const TextStyle(
                    fontFamily: 'Beaufort', fontWeight: FontWeight.w400, fontSize: 15))
          ,
          const SizedBox(height: 30),
          Text(championPoints > 0 ? '$championPoints' : '',
              style: const TextStyle(
                  fontFamily: 'Beaufort', fontWeight: FontWeight.w400, fontSize: 40))
          ,
          const SizedBox(height: 10),
          Text(championPoints > 0 ? 'PUNTOS DE MAESTRIA' : 'JUEGA ESTE CAMPEÓN Y OBTEN COFRECITO!',
              style: const TextStyle(
                  fontFamily: 'Beaufort', fontWeight: FontWeight.w400, fontSize: 15))
          ,
          const SizedBox(height: 30),
          CircleAvatar(backgroundImage: AssetImage(_hasChest(chestGranted)), radius: 40,),
          const SizedBox(height: 10),
          Text(chestGranted ? 'COFRE OBTENIDO' :'¡COFRE DISPONIBLE!',
              style: const TextStyle(
                  fontFamily: 'Beaufort', fontWeight: FontWeight.w400, fontSize: 15)),
        ]
        ),
      ));
}
}

_getImage(String? champId) {
  return champId == null
      ? Image.asset('assets/images/champion_512x512.jpg')
      : CachedNetworkImageProvider('https://lolcito-express.onrender.com/api/v1/champion/icon/$champId');
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

_hasChest(chestGranted) {
  return chestGranted
      ? 'assets/images/cofre-hextech.png'
      : 'assets/images/no-cofre.jpg';
}