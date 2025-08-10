import 'package:app3_series_api/tv_show_grid.dart';
import 'package:app3_series_api/tv_show_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TvShowSearchScreen extends StatefulWidget {
  const TvShowSearchScreen({super.key});

  @override
  State<TvShowSearchScreen> createState() => _TvShowSearchScreenState();
}

class _TvShowSearchScreenState extends State<TvShowSearchScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  late Future<List<TvShow>>? searchResults;

  bool onSubmit = false;
  void submit() {
    if (_formKey.currentState!.validate()) {
      final tvShowModel = context.read<TvShowModel>();
      setState(() {
        onSubmit = true;
        searchResults = tvShowModel.searchTvShows(_controller.text);
      });
    }
  }