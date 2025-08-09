import 'package:app3_series_api/tv_show_service.dart';
import 'package:flutter/material.dart';
class TvShow {
  int id;
  String imageUrl;
  String name;
  String webChannel; ratting;
  String summary;

  TvShowModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return TvShowModel(
      id: json['id'],
      name: json['name'],
      image: json['image'] != null ? json['image']['medium'] : '',
    );
  }
}