import 'package:app3_series_api/tv_show_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TvShowGrid extends StatefulWidget {
  const TvShowGrid({super.key, required this.tvShows});

  final List<TvShow> tvShows;

  @override
  State<TvShowGrid> createState() => _TvShowGridState();
}