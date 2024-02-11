import 'package:flutter/material.dart';
import 'package:cofrecito/pages/pages.dart';
import 'package:cofrecito/providers/providers.dart';
import 'package:cofrecito/shared/preferences.dart';
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
        'champions': (context) => ChampionsListPage(),
        'home_logged': (context) => const HomeLogged(),
        'support': (context) => const MessageScreen()
      },
    );
  }
}
