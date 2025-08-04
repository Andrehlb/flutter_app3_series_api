import 'dart:convert';
import 'package:http/http.dart' as http;
import 'tv_show_model.dart';

class TvShowService {
  static const String url = 'https://api.tvmaze.com/shows';

  static Future<List<TvShowModel>> fetchTvShows() async {
    final response  = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => TvShowModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load TV shows');
    }
  }
}
