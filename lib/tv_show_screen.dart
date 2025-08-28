import 'package:app3_series_api/tv_show_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TvShowScreen extends StatefulWidget {
  const TvShowScreen({super.key, required this.id});

  final int id;

  @override
  State<TvShowScreen> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends State<TvShowScreen> {
  late Future<TvShow> tvShow = context.read<TvShowModel>().getTvShowById(
    widget.id,
  );

  @override
  Widget build(BuildContext context) {
    final tvShowModel = context.watch<TvShowModel>();

    return FutureBuilder(
      future: tvShow,
      builder: (context, snapshot) {
        TvShow? tvShow = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              height: 96,
              width: 96,
              child: CircularProgressIndicator(strokeWidth: 12),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Container(
              padding: EdgeInsets.all(32),
              child: Column(
                spacing: 32,
                children: [
                  Text(
                    'Erro: ${snapshot.error}',
                    style: TextStyle(fontSize: 24),
                  ),
                  ElevatedButton(
                    onPressed: () => context.go('/'),
                    child: Text('VOLTAR'),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            padding: EdgeInsets.all(32),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    tvShow!.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      tvShow.imageUrl,
                      width: 200,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                          ? child
                          : Center(
                              child: CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                      errorBuilder: (context, child, stackTrace) => Container(
                        width: double.infinity,
                        height: 200,
                        color: Theme.of(context).colorScheme.primary,
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Web Channel: ${tvShow.webChannel}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    tvShow.rating == 0.0
                        ? 'Nota: N/A'
                        : 'Nota: ${tvShow.rating}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  // Text(tvShow.summary, style: TextStyle(fontSize: 16)),
                  Html(data: tvShow.summary),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.go('/search'),
                        child: Text('VOLTAR'),
                      ),
                      SizedBox(width: 16),
                      FutureBuilder<bool>(
                        future: tvShowModel.isFavorite(tvShow),
                        builder: (context, snapshot) {
                          final isFavorite = snapshot.data ?? false;
                          return ElevatedButton(
                            onPressed: () {
                              isFavorite
                                  ? tvShowModel.removeFromFavorites(tvShow)
                                  : tvShowModel.addToFavorites(tvShow);
                            },
                            child: Text(isFavorite ? 'DESFAVORITAR' : 'FAVORITAR'),
                          );
                        },
                      ),
                      SizedBox(width: 32),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}