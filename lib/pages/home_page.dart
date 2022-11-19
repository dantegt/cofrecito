import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  String _server = 'LAS';

  final _servers = ['LAS', 'LAN', 'NA', 'EUW', 'KR'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COFRECITO',
            style:
                TextStyle(fontFamily: 'Beaufort', fontWeight: FontWeight.w800)),
        elevation: 10.0,
      ),
      drawer: const DrawerMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FadeInImage(
              image: AssetImage('assets/images/cofre-hextech.png'),
              placeholder: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill,
              height: 170,
            ),
            const SizedBox(height: 30),
            const Text('¡Esos cofrecitos no se van a sacar solos!',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Beaufort',
                    color: Colors.black87)),
            const SizedBox(height: 5),
            const Text(
              'Confirma si tienes cofre disponible para tus partidas de ARAM.',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            const Image(
              image: AssetImage('assets/images/LogoDark.png'),
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 25),
            const Text(
              'Descripcion de la app',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DropdownButton(
                                value: _server,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: _servers.map((String server) {
                                  return DropdownMenuItem(
                                      value: server, child: Text(server));
                                }).toList(),
                                onChanged: (String? selected) {
                                  setState(() {
                                    _server = selected!;
                                  });
                                }),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 300,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    icon: Icon(Icons.arrow_forward_ios),
                                    labelText: 'Summoner id'),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Column(children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ]),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
