import 'package:flutter/material.dart';
import 'package:flutter_app/pages/pages.dart';
import 'package:flutter_app/themes/default.dart';

import './shared/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: DefaultTheme
          .defaultTheme, // tema personalizado ( Dark mode como default )
      darkTheme: DefaultTheme.lightTheme,
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomePage(),
        'champions': (context) => const ChampionsListPage(),
        'message':(context) => MessageScreen(),
      },
    );
  }
}
