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
      rating: json['rating']?['average']?.toDouble() ?? 0.0,
      summary: json['summary'] ?? 'Sem resumo disponível.',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'webChannel': webChannel,
      'rating': rating,
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

  void _setError(String? error) {
    _errorMessage = error;
    notifyListeners();
  }

  // Carrega as séries favoritas do banco de dados
  Future<void> load() async {
    try {
      _setLoading(true);
      _setError(null);
      _tvShows = await _tvShowService.getAll();
    } catch (e) {
      _setError('Falha ao carregar séries favoritas: ${e.toString()}');
    } finally {
      _setLoading(false);
    }
  }

  // Adiciona séries favoritas
  Future<void> addToFavorites(TvShow tvShow) async {
    await _tvShowService.insert(tvShow);
    _tvShows.add(tvShow);
    notifyListeners();
  }

  // Remove séries favoritas
  Future<void> removeFromFavorites(TvShow tvShow) async {
    await _tvShowService.delete(tvShow.id);
    _tvShows.removeWhere((show) => show.id == tvShow.id);
    notifyListeners();
  }

  // Verifica se uma série é favorita
  Future<bool> isFavorite(TvShow tvShow) async {
    try {
      return await _tvShowService.isFavorite(tvShow);
    } catch (e) {
      _setError('Falha em verificar se é favorita: ${e.toString()}');
      return false;
    }
  }

  // Ordena as séries favoritas por nome
  void sortByName(bool ascending) {
    _tvShows.sort(
      (a, b) => ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name),
    );
    notifyListeners();
  }

  // Ordena as séries favoritas por nota
  void sortByRating(bool ascending) {
    _tvShows.sort(
      (a, b) => ascending
          ? a.rating.compareTo(b.rating)
          : b.rating.compareTo(a.rating),
    );
    notifyListeners();
  }

  // API
  Future<TvShow> getTvShowById(int id) async {
    try {
      return await _tvShowService.fetchTvShowById(id);
    } catch (e) {
      throw Exception('Falha em carregar série: ${e.toString()}');
    }
  }

  Future<List<TvShow>> searchTvShows(String query) async {
    try {
      return await _tvShowService.fetchTvShows(query);
    } catch (e) {
      throw Exception('Falha em buscar séries: ${e.toString()}');
    }
  }

  void addTvShow(TvShow tvShow, BuildContext context) {
    tvShows.add(tvShow);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Série adicionada com sucesso!',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }

  void removeTvShow(TvShow tvShow, BuildContext context) {
    final index = tvShows.indexWhere(
      (show) => show.name.toLowerCase() == tvShow.name.toLowerCase(),
    );
    tvShows.removeAt(index);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${tvShow.name} excluída!'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'DESFAZER',
          onPressed: () {
            tvShows.insert(index, tvShow);
            notifyListeners();
          },
        ),
      ),
    );
    notifyListeners();
  }

  void editTvShow(TvShow oldTvShow, TvShow newTvShow, BuildContext context) {
    final index = tvShows.indexOf(oldTvShow);
    tvShows[index] = newTvShow;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Série ${index + 1} atualizada!'),
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }
}