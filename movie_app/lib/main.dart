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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexAtual = 0;

  final telas = [
    FilmesPage(),
    Center(child: Text("Favoritos")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telas[indexAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexAtual,
        onTap: (index) {
          setState(() => indexAtual = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Filmes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favoritos",
          ),
        ],
      ),
    );
  }
}
