import 'package:app3_series_api/custom_drawer.dart';
import 'package:app3_series_api/tv_show_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// Tela base que contém o AppBar e o Drawer
class BaseScreen extends StatelessWidget {
  final Widget child;

  const BaseScreen({super.key, required this.child});
  
  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

// Estado da BaseScreen
class _BaseScreenState extends State<BaseScreen> { 

  bool _isAscending = true; // Variável para controlar a ordenação

  @override
  Widget build(BuildContext context) {

    override
  widget build(BuildContext context) {

    // Obtém o caminho atual da rota
    final currentPath = GoRouterState.of(context).uri.path;
    final viewModel = context.watch<TvShowModel>();

    return Scaffold(
      appBar: AppBar(
        title: Row (
          mainAxisAlignment: MainAxisAlignment.end, // Alinha o título à direita
          children: [Text('Eu 💛 Séries 🎬')],
        ),
      ),
      
      drawer: CustomDrawer(), // <- aqui está um segredo.
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
}