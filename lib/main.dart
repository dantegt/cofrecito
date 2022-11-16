import 'package:flutter/material.dart';
import 'package:flutter_app/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COFRECITO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomePage(),
        'champions': (context) => const ChampionsListPage(),
      },
    );
  }
}
