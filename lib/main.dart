import 'package:flutter/material.dart';
import 'package:flutter_app/pages/pages.dart';
import 'package:flutter_app/providers/providers.dart';
import 'package:flutter_app/shared/preferences.dart';
import 'package:provider/provider.dart';

import './shared/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
          create: (context) =>
              ThemeProvider(darkmodeEnabled: Preferences.darkmode))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      initialRoute: Preferences.isLogged ? 'home_logged' : 'home',
      routes: {
        'home': (context) => const HomePage(),
        'champions': (context) => const ChampionsListPage(),
        'home_logged': (context) => const HomeLogged(),
        'support': (context) => MessageScreen()
      },
    );
  }
}
