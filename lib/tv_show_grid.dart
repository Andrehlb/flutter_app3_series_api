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

class _TvShowGridState extends State<TvShowGrid> {
  @override
  Widget build(BuildContext context) {
    final tvShowModel = context.watch<TvShowModel>();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.6,
      ),
      itemCount: widget.tvShows.length,
      itemBuilder: (context, index) {
        final tvShow = widget.tvShows[index];
        return Stack(
          children: [
            GestureDetector(
              onTap: () => context.go('/tvshow/${tvShow.id}'),
              child: Card(
                elevation: 5,
                margin: EdgeInsets.zero,
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),