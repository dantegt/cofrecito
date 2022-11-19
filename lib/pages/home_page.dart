import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/images/LogoDark.png'),
              width: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 25),
            Text('Cofrecito',
                style: TextStyle(fontSize: 20, color: Colors.blueGrey)),
            SizedBox(height: 25),
            Text(
              'Descripcion de la app',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            Text('Formulario de seleccion',
                style: TextStyle(fontSize: 20, color: Colors.blueGrey)),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
