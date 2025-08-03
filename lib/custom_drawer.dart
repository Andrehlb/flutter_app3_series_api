import 'package: flutter/material.dart';
import 'package:flutter/material.dart';

class CustomDrwawer extends StatelessWidget {
  const CustomDrwawer({super.key});

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