import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tv_show_model.dart';
import 'tv_show_screen.dart';

void main() {
  runApp(const MyApp());
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
