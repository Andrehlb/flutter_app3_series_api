import 'package:app3_series_api/custom_drawer.dart';
import 'package:app3_series_api/tv_show_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;

  const BaseScreen({super.key, required this.child});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  bool _isAscending = true;

  @override
  Widget build(BuildContext context) {

    // Obtém o caminho atual da rota
    final currentPath = GoRouterState.of(context).uri.path;
    final viewModel = context.watch<TvShowModel>();
    
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end, // Alinha à direita
            children: [Text('Eu Amo Séries 🎬')],
          ),
        ),
        drawer: CustomDrawer(),
        body: widget.child,
        floatingActionButton: currentPath == '/'
          ? SpeedDial(
              elevation: 5,
              icon: Icons.sort,
              activeIcon: Icons.close,
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              foregroundColor: Theme.of(context).colorScheme.primary,
              overlayColor: Theme.of(context).colorScheme.primary,
              overlayOpacity: 0.5,
              children: [
                SpeedDialChild(
                  child: Icon(
                    Icons.sort_by_alpha,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: 'Ordernar por Nome',
                  labelBackgroundColor: Theme.of(context).colorScheme.surface,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  onTap: () {
                    viewModel.sortByName(_isAscending);
                    setState(() {
                      _isAscending = !_isAscending;
                    });
                  },
                ),
                SpeedDialChild(
                  child: Icon(
                    Icons.star_rate,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: 'Ordernar por Nota',
                  labelBackgroundColor: Theme.of(context).colorScheme.surface,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  onTap: () {
                    viewModel.sortByRating(_isAscending);
                    setState(() {
                      _isAscending = !_isAscending;
                    });
                  },
                ),
              ],
            )
          : null,
      );
  }
}