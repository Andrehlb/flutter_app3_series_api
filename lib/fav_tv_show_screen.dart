import 'package:flutter/material.dart';
import 'tv_show_model.dart';

class FavTvShowScreen extends StatefullWidget {
  const FavTvShowScreen({super.key});

  @override
  _FavTvShowScreenState createState() => _FavTvShowScreenState();
}

class _FavTvShowScreenState extends State<FavTvShowScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Séries Favoritas')
      ),
      body: center(
        chil: column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 96, color: Colors.deepPurple),
            const SizedBox(height: 32),
            const Text(
              'Adicione suas séries favoritas!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}