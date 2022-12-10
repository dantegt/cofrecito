import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
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
          ListTile(
            title: const Text('Champions'),
            leading: const Icon(Icons.person),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'champions');
            },
          ),
          const Divider(height: 5),
          ListTile(
            title: const Text('Message'),
            leading: const Icon(Icons.person),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'message');
            },
          ),
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
