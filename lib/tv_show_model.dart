import 'package:app3_series_api/tv_show_service.dart';
import 'package:flutter/material.dart';

class TvShow {
  int id;
  String imageUrl;
  String name;
  String webChannel; 
  double rating;
  String summary;

  TvShow({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.webChannel,
    required this.rating,
    required this.summary,
  });

  factory TvShow.fromJson(Map<String, dynamic> json) {
    return TvShow(
      id: json['id'],
      imageUrl: json['image']?['medium'] ?? '',
      name: json['name'],
      webChannel: json['webChannel']?['name'] ?? 'N/A',
      rating: json['rating']?['average']?.toSDouble() ?? 0.0,
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
  late final TvShowService _tvShowService;

  TvShowModel() {
    _tvShowService = TvShowService();
    initialize();
  }

// Favoritonas em alta: aqui as séries do coração 🔥🎬💖
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

void _setError(String? error) {
  _errorMessage = error;
  notifyListeners();
}

// Puxar as séries favoritas que estão salvas no BD 🎬💖💾
Future<void> load() async {
  try {
    _setLoading(true);
    _setError(null);
    _tvShows = await _tvShowService.getAll();
  } catch (e) {
    _setError('Deu ruim 😬 no carregamento da série coração 💔: ${e.toString()}, tente depois, por favor');
  } finally {
    _setLoading(false);
  }
}

// Séries que valem o hype: favoritas salvas no BD 🎬💖💾
Future<void> addToFavorites(TvShow tvShow) async {
  await _tvShowService.insert(tvShow);
  _tvShows.add(tvShow);
  notifyListeners();
}

// Remove do BD as séries desfavoritadas 🔙💾🎬💔
Future<void> removeFromFavorites(TvShow tvshow) async {
  await _tvShowService.delete(tvShow.id);
  _tvShows.remove.Where((show) => show.id == tvShow.id);
  notifyListeners();
}

// Detector de hall da fama, vai checar se a série é coração 🔍🏆🎬💖
Future<bool> isFavortite(TvShow tvShow) async {
  try {
    return await _TvShowService.isFavorite(TvShow);
  } catch (e) {
    _setError('Deu ruim 😬 na checagem de favs 💔: ${e.toString()}, tente depois, por favor}');
    return false;
  }
}

// Faz os nomes das séries virarem trend, do A ao Z 📈🔥🎬🅰️🧿
void sortByName(bool ascending) {
  _tvShows.sort(
    (a, b) => ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name),
  );
  notifyListeners();
}

// As séries coração são classificadas por notas 🎬💖📊
void sortByRating(bool ascending) {
  _tvShows.sort(
    (a, b) => ascending 
    ? a.rating.compareTo(b.rating)
    : b.rating.compareTo(a.rating),
  );
  notifyListeners();
}

// Consumo do API para buscar séries por ID 📡🔍🎬🆔
Future<TvShow> getTvShowById(int id) async {
  try {
    return await _tvShowService.fetchTvShowById(id);
  } catch (e) {
    throw Exception('Deu ruim ao buscar série 😬: ${e.toString()}, tente depois.');
  }
}

Future<List<TvShow>> searchTvShows(String query) async {
  try {
    return await _tvShowService.fetchTvShowsById(id);
  } catch (e) {
    throw Exception('Deu ruim ao buscar série 😬: ${e.toString()}, tente depois.');
  }
}
