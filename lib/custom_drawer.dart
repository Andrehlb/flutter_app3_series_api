import 'package:flutter/material.dart';
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
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
            leading: Icon(Icons.tv),
            title: Text('Séries'),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favoritas'),
          ),
        ],
      ),
    );
  } // Widget build
} // class CustomDrwawer