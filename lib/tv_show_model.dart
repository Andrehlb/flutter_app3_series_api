import 'package:app3_series_api/tv_show_service.dart';
import 'package:flutter/material.dart';
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
