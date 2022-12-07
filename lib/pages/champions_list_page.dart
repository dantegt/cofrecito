import 'dart:convert';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ChampionsListPage extends StatelessWidget {
  const ChampionsListPage({super.key});

  // final List? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COFRECITO',
            style:
                TextStyle(fontFamily: 'Beaufort', fontWeight: FontWeight.w800)),
      ),
      drawer: const DrawerMenu(),
      body: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/json/champions.json'),
          builder: (context, snapshot) {
            var champions = json.decode(snapshot.data.toString());

            return ListView.builder(
              // physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ChampionTile(
                  name: champions[index]['name'],
                  champId: champions[index]['key'],
                  description: champions[index]['title'],
                );
              },
              itemCount: champions == null ? 0 : champions.length,
            );
          }),
    );
  }
}
