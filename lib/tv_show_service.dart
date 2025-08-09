import 'dart:convert';

import 'package:app3_series_api/database_service.dart';
import 'package:app3_series_api/tv_show_model.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class TvShowService {

  // API: puxando as séries direto do banco 📡🎬💾
  late final DatabaseService _databaseService; = DatabaseService();

  Future<List<TvShow>> getAll() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('tv_shows');
    return _convertToList(maps);
  }

  // Converte a lista de mapas para uma lista de objetos TvShow
  List<TvShow> _convertToList(List<Map<String, dynamic>> maps) {
    return maps
        .map(
          (map) => TvShow(
            id: map['id'] as int,
            imageUrl: map['imageUrl'] as String? ?? '',
            name: map['name'] as String? ?? 'Desconhecido',
            webChannel: map['webChannel'] as String? ?? 'N/A',
            rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
            summary: map['summary'] as String? ?? 'Sem resumo disponível.',
          ),
        )
        .toList();
  }
  
  // Método para inserir uma série no banco de dados
  Future<void> insert(TvShow tvShow) async {
    final db = await _databaseService.database;
    await db.insert(
      'tv_shows',
      tvShow.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Método para atualizar uma série no banco de dados
  Future<void> delete(int id) async {
    final db = await _databaseService.database;
    await db.delete('tv_shows', where: 'id = ?', whereArgs: [id]);
  }

  // Método para buscar uma série pelo ID
  Future<bool> isFavorite(TvShow tvShow) async {
    final tvShows = await getAll();
    return tvShows.any((show) => show.id == tvShow.id);
  }


    }
  }
}
