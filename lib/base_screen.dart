import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget drawer;

  const BaseScreen({
    super.key,
    required this.title,
    required this.body,
    required this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: drawer,
      body: body,
    );
  }
}