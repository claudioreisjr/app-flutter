import 'package:flutter/material.dart';
import '../services/api_service.dart';

class FilmesPage extends StatefulWidget {
  @override
  _FilmesPageState createState() => _FilmesPageState();
}

class _FilmesPageState extends State<FilmesPage> {
  List filmes = [];

  @override
  void initState() {
    super.initState();
    carregarFilmes();
  }

  carregarFilmes() async {
    final dados = await ApiService.getFilmes();
    setState(() {
      filmes = dados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filmes Populares")),
      body: filmes.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: filmes.length,
              itemBuilder: (context, index) {
                final filme = filmes[index];
                return ListTile(
                  leading: Image.network(
                    "https://image.tmdb.org/t/p/w200${filme['poster_path']}",
                  ),
                  title: Text(filme['title']),
                  subtitle: Text("Nota: ${filme['vote_average']}"),
                );
              },
            ),
    );
  }
}
