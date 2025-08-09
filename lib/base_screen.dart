import 'package:app3_series_api/custom_drawer.dart';
import 'package:app3_series_api/tv_show_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Séries'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: const CustomDrawer(), // <- aqui está um segredo.
      body: const TvShowScreen(), // Tela principal da aplicação
    );
  }
}