import 'package:flutter/material.dart';
import '../services/favoritos_service.dart';
import 'detalhes_page.dart';

class FavoritosPage extends StatefulWidget {
  @override
  _FavoritosPageState createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  List favoritos = [];

  @override
  void didChangeDependencies() {
  super.didChangeDependencies();
  carregar();
}

  carregar() async {
    final dados = await FavoritosService.getFavoritos();
    setState(() {
      favoritos = dados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favoritos")),
      body: favoritos.isEmpty
          ? Center(child: Text("Nenhum favorito salvo"))
          : ListView.builder(
              itemCount: favoritos.length,
              itemBuilder: (context, i) {
                final filme = favoritos[i];
                return ListTile(
                  title: Text(filme['title']),
                  leading: Image.network(
                    "https://image.tmdb.org/t/p/w200${filme['poster_path']}",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetalhesPage(filme),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
