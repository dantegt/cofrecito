import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_logged.dart';
import 'package:flutter_app/shared/preferences.dart';

import '../widgets/widgets.dart';
import '../shared/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  String _server = Preferences.server;
  final _servers = Constants.serversLabels;
  final TextEditingController _summonerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appName,
            style: const TextStyle(
                fontFamily: 'Beaufort', fontWeight: FontWeight.w800)),
        elevation: 10.0,
      ),
      drawer: const DrawerMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Flexible(
              child: Container(
                  constraints: const BoxConstraints(maxHeight: 180),
                  child: const FadeInImage(
                    image: AssetImage('assets/images/LogoDark.png'),
                    placeholder: AssetImage('assets/images/LogoLight.png'),
                  ))),
          const SizedBox(height: 40),
          const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: (Text('¡Esos cofrecitos no se van a sacar solos!',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Beaufort')))),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Text(
              'Confirma si tienes cofre disponible para tus partidas de ARAM.',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 25),
          Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 20, top: 2),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).splashColor,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomLeft: Radius.circular(40))),
                              height: 55,
                              width: 80,
                              child: DropdownButton(
                                  underline: const SizedBox(),
                                  value: Preferences.server,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: _servers.map((Map<String, String> server) {
                                    return DropdownMenuItem(
                                        value: server['server']!, child: Text(server['label']!));
                                  }).toList(),
                                  onChanged: (String? selected) {
                                    setState(() {
                                      _server = selected!;
                                      Preferences.server = selected;
                                    });
                                  }),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 5, top: 2),
                              color: Theme.of(context).splashColor,
                              height: 55,
                              width: 160,
                              child: TextFormField(
                                controller: _summonerController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: 'Invocador'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Falta invocador.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(0, 55),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  )),
                                  backgroundColor:
                                      const Color.fromRGBO(174, 145, 75, 1),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Buscando invocador...')),
                                    );
                                    var summonerData = await getSummonerFromAPI(_server, _summonerController.text);
                                    if(summonerData.containsKey('status') && summonerData['status'] == 400) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                            Text('No se encontró el Invocador')),
                                      );
                                    } else {
                                      setState(() {
                                        Preferences.summoner = summonerData['name'];
                                        Preferences.summonerPuuid = summonerData['puuid'];
                                        Preferences.level = summonerData['summonerLevel'];
                                        Preferences.icon = summonerData['profileIconId'];
                                        Preferences.isLogged = true;
                                      });

                                      Future.delayed(const Duration(seconds: 2),
                                          () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                const HomeLogged()));
                                      });
                                    }

                                  }
                                },
                                child: const Text('Submit'),
                              ),
                            ])
                      ],
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  getSummonerFromAPI(server, summoner) async {
    var url = 'https://lolcito-express.onrender.com/api/v1/summoner/$server/$summoner';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body) as Map<String, dynamic>;
    debugPrint('########### JSON: $json');
    return json;
  }
}
