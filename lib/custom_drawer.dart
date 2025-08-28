import 'package:app3_series_api/my_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Eu Amo Séries 🎬',
                    style: GoogleFonts.lobster(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: context.read<MyThemeModel>().toogleTheme,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onSurface,
                      foregroundColor: Theme.of(context).colorScheme.surface,
                    ),
                    icon: !context.watch<MyThemeModel>().isDark
                        ? Icon(Icons.nightlight_round_sharp, size: 24)
                        : Icon(Icons.wb_sunny_outlined, size: 24),
                    label: Text('Mudar Tema'),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favoritas'),
            onTap: () {
              Navigator.of(context).pop();
              context.go('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Buscar'),
            onTap: () {
              // switchScreen(1);
              Navigator.of(context).pop();
              context.go('/search');
            },
          ),
        ],
      ),
    );
  }
}