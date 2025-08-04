import 'package:flutter/material.dart';
import 'custom_drawer.dart';

class TvShowScreen extends StatelessWidget {
  const TvShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Séries'),
      ),
      drawer: const CustomDrawer(),
      body: const Center(child: Text('Séries')),
    );
  }
}