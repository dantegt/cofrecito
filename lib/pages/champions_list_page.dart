import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ChampionsListPage extends StatelessWidget {
  const ChampionsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COFRECITO',
            style:
                TextStyle(fontFamily: 'Beaufort', fontWeight: FontWeight.w800)),
      ),
      drawer: const DrawerMenu(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ChampionTile(
              name: 'Kogmaw',
              image:
                  'https://raw.communitydragon.org/12.9/game/assets/characters/aatrox/hud/aatrox_circle.png'),
          ChampionTile(),
          ChampionTile(),
          ChampionTile(),
          ChampionTile(),
          ChampionTile(),
          ChampionTile(),
        ],
      ),
    );
  }
}
