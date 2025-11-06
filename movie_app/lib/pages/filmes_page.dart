import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'package:movie_app/pages/detalhes_page.dart';


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

  int pagina = 1;

  carregarFilmes() async {
    final dados = await ApiService.getFilmes(pagina);

    dados.sort((a, b) => (b['vote_average']).compareTo(a['vote_average'])); // ordena desc

    setState(() {
      filmes.addAll(dados);
      pagina++;
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
                 if (index == filmes.length - 1) {
                  carregarFilmes(); // carrega mais filmes ao chegar no final da lista
                 }
                final filme = filmes[index];
                return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetalhesPage(filme),
                        ),
                      );
                    },
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
