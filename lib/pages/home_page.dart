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
            const SizedBox(height: 60),
            const FadeInImage(
              image: AssetImage('assets/images/LogoDark.png'),
              placeholder: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill,
              height: 170,
            ),
            const SizedBox(height: 40),
            const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: (Text('¡Esos cofrecitos no se van a sacar solos!',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Beaufort',
                        color: Color.fromARGB(255, 217, 219, 209))))),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Text(
                'Confirma si tienes cofre disponible para tus partidas de ARAM.',
                style: TextStyle(
                  color: Color.fromARGB(255, 217, 219, 209),
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
                                padding:
                                    const EdgeInsets.only(left: 20, top: 2),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 7, 13, 15),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        bottomLeft: Radius.circular(40))),
                                height: 55,
                                width: 80,
                                child: DropdownButton(
                                    underline: const SizedBox(),
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
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 5, top: 2),
                                color: const Color.fromARGB(255, 7, 13, 15),
                                height: 55,
                                width: 160,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Summoner id'),
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
                                  onPressed: () {
                                    // Validate returns true if the form is valid, or false otherwise.
                                    if (_formKey.currentState!.validate()) {
                                      // If the form is valid, display a snackbar. In the real world,
                                      // you'd often call a server or save the information in a database.
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing Data')),
                                      );
                                    }
                                  },
                                  child: const Text('Submit'),
                                ),
                              ])
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
