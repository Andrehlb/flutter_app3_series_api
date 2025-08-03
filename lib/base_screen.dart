import 'package:flutter/material.dart';
import 'custom_drawer.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Séries'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: CustomDrawer(), // <- aqui está um segredo.
      body: const TvShowScreen(), // Tela principal da aplicação
    );
  }
}