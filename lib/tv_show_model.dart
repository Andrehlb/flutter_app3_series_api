import 'package:app3_series_api/tv_show_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3_series_api/tv_show_service.dart';
class TvShow {
  int id;
  String imageUrl;
  String name;
  String webChannel; ratting;
  String summary;

  TvShow({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.webChannel,
    required this.ratting,
    required this.summary,
  });

  factory TvShow.fromJson(Map<String, dynamic> json) {
    return TvShow(
      id: json['id'],
      imageUrl: json['image']?['medium'] ?? '',
      name: json['name'],
      webChannel: json['webChannel']?['name'] ?? 'N/A',
      ratting: json['rating']?['average']?.toSDouble() ?? 0.0,
      summary: json['summary'] ?? 'Resumo não disponível',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl, //'image': {'medium': imageUrl},
      'name': name,
      'webChannel': webChannel, //'webChannel': {'name': webChannel},
      'rating': rating, //'rating': {'average': ratting},
      'summary': summary,
    };
  }
}

class TvShowModel extends ChangeNotifier {
  late TvShowService _tvShowService;

  TvShowModel() {
    _tvShowService = TvShowService();
    initialize();
  }
}

// Estado das séries favoritas
List<TvShow> _tvShows = [];
bool _isLoading = false;
String? _errorMessage;

List<TvShow> get tvShows => _tvShows;
bool get isLoading => _isLoading;
String? get errorMessage => _errorMessage;
bool get hasFavorites => _tvShows.isNotEmpty;

// BD
Future<void> initialize() async {
  await load();
}

void _setLoading(bool loading) {
  _isLoading = loading;
  notifyListeners();
}

// Puxar as séries favoritas que estão salvas no BD
Future<void> load() async {
  try {
    _setLoading(true);
    _setError(null);
    _tvShows = await _tvShowService.getAll();
  } catch (e) {
    _setError('Deu ruim no carregamento das séries favoritas, tente depois por favor: ${e.toString()}');
  } finally {
    _setLoading(false);
  }
}

// Adiciona as séries favoritas no BD
Future<void> addToFavorites(TvShow tvShow) async {
  await _tvShowService.insert(tvShow);
  _tvShows.add(tvShow);
  notifyListeners();
}