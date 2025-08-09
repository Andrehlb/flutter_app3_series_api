import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tv_show_model.dart';
import 'tv_show_screen.dart';


// Métodod para reiniciar o System UI
void restartSystemUI() {
  try {
    Process.run('adb', ['restart'], runInShell: true);
  } catch (e) {
    print('Erro ao reiniciar o System UI: $e');
  }
}
void main() {
  restartSystemUI(); // Reinicia o System UI ao iniciar o app
  WidgetsFlutterBinding.ensureInitialized(); // Garante que o Flutter esteja inicializado antes de usar
  runApp(
    ChangeNotifierProvider(
      create: (_) => TvShowModel(), // Cria uma instância do modelo TvShowModel
      child: const MyApp(); // Inicia o aplicativo com MyApp como widget raiz
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eu 💛 Séries',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        ),
        home: const TvShowScreen(),
    );  
  }
}
