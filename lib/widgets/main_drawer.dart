import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            alignment: Alignment.center,
            height: 180,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: const Text(
              'Cooking up!',
              style: TextStyle(
                color: Colors.red,
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
            leading: const Icon(Icons.restaurant),
            title: const Text(
              'Meals',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/filter_screen');
            },
            leading: const Icon(Icons.settings),
            title: const Text(
              'Filters',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ]),
      ),
    );
  }
}
