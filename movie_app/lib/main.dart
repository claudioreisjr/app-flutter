import 'package:flutter/material.dart';
import 'pages/filmes_page.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FilmesPage(),
    );
  }
}
