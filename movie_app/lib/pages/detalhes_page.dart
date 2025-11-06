import 'package:flutter/material.dart';
import '../services/favoritos_service.dart';

class DetalhesPage extends StatelessWidget {
  final Map filme;
  DetalhesPage(this.filme);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          filme['title'],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white), // deixa seta de voltar branca
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster grande
            Image.network(
              "https://image.tmdb.org/t/p/w500${filme['backdrop_path']}",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título
                  Text(
                    filme['title'],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),

                  // Nota com estrela
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 5),
                      Text(
                        "${filme['vote_average']}",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                  SizedBox(height: 20),

                  // Descrição
                  Text(
                    filme['overview'] ?? "Sem descrição",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  SizedBox(height: 20),

                  // Botão Favoritar
                  ElevatedButton.icon(
                    onPressed: () async {
                      await FavoritosService.salvarFavorito(filme);
                      print("Filme salvo: ${filme['title']}");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Adicionado aos favoritos!")),
                      );
                    },
                    icon: Icon(Icons.favorite, color: Colors.white),
                    label: Text("Adicionar aos Favoritos"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
