import 'package:flutter/material.dart';
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Text(
              'Eu Amo Séries',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ), 
          ),
          ListTile(
            leading: const Icon(Icons.tv),
            title: const Text('Séries'),
            onTap: () {
              // ação ao clicar em Séries
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favoritas'),
            onTap: () {
              // ação ao clicar em Favoritas
            },
          ),
        ],
      ),
    );
  } // Widget build
} // class CustomDrwawer