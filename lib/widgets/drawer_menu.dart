import 'package:flutter/material.dart';
import 'package:flutter_app/providers/providers.dart';
import 'package:flutter_app/shared/preferences.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            title: const Text('Find Summoner'),
            leading: const Icon(Icons.search),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
          const Divider(height: 5),
          const Divider(height: 5),
          ListTile(
            title: const Text('Champions'),
            leading: const Icon(Icons.person),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'champions');
            },
          ),
          const Divider(height: 5),
           ListTile(
            title: const Text('Home logged (TEST)'),
            leading: const Icon(Icons.person),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'home_logged');
            },
          ),
          ListTile(
            title: const Text('Message'),
            leading: const Icon(Icons.person),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'message');
            },
          ),
          const Divider(height: 5),
          Flexible(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            SwitchListTile.adaptive(
                title: const Text('Dark Mode'),
                value: Preferences.darkmode,
                onChanged: (value) {
                  setState(() {
                    Preferences.darkmode = value;
                    value ? currentTheme.setDark() : currentTheme.setLight();
                  });
                })
          ]))
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
              opacity: 0.9)),
      child: Container(
        alignment: Alignment.centerLeft,
        child: const Text(
          'COFRECITO',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'Beaufort',
              fontWeight: FontWeight.w800),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
