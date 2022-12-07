import 'package:flutter/material.dart';
import '../shared/constants.dart';

class ChampionTile extends StatelessWidget {
  const ChampionTile({super.key, this.name, this.champId, this.description});

  final String? name;
  final String? champId;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name ?? 'Champion name'),
      leading: CircleAvatar(
        backgroundImage: _getImage(champId),
      ),
      trailing: Wrap(
        children: [
          CircleAvatar(
              backgroundImage: const AssetImage('assets/images/background.png'),
              child: Stack(
                children: <Widget>[
                  Text(
                    '7',
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
                  const Text('7',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Beaufort',
                        color: Colors.amber,
                      )),
                ],
              )),
          const SizedBox(width: 5),
          const CircleAvatar(
              backgroundImage: AssetImage('assets/images/cofre-hextech.png')),
        ],
      ),
      subtitle: Text(description ?? 'The champion description'),
    );
  }
}

_getImage(String? champId) {
  return champId == null
      ? Image.asset('assets/images/champion_512x512.jpg')
      : NetworkImage('${Constants.cdn}/champion/$champId/square');
}
