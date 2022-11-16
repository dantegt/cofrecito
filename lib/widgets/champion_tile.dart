import 'package:flutter/material.dart';

class ChampionTile extends StatelessWidget {
  ChampionTile({super.key, this.name, this.image});

  String? name;
  String? image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name ?? 'Trundle'),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(image ??
            'https://raw.communitydragon.org/12.9/game/assets/characters/aatrox/hud/aatrox_circle.png'),
      ),
      trailing: CircleAvatar(
        backgroundImage: NetworkImage(image ??
            'https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/assets/loot/hexbose_chest_490px.png'),
      ),
      subtitle: Text('help block'),
    );
  }
}
