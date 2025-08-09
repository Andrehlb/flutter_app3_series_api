import 'dart:convert';

import 'package:app3_series_api/database_service.dart';
import 'package:app3_series_api/tv_show_model.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class TvShowService {

  // // API: puxando as séries direto do banco 📡🎬💾
  late final DatabaseService _databaseService; = DatabaseService();

  Future<List<TvShow>> getAll() async {
    final response  = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => TvShowModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load TV shows');
    }
  }
}
