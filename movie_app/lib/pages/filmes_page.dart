import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'detalhes_page.dart';

class FilmesPage extends StatefulWidget {
  @override
  _FilmesPageState createState() => _FilmesPageState();
}

class _FilmesPageState extends State<FilmesPage> {
  List filmes = [];
  List filmesFiltrados = []; // ✅ lista filtrada
  TextEditingController buscaController = TextEditingController(); // ✅ controller da busca
  int pagina = 1;

  @override
  void initState() {
    super.initState();
    carregarFilmes();
  }

  carregarFilmes() async {
    final dados = await ApiService.getFilmes(pagina);

    // Ordenar por maior nota
    dados.sort((a, b) => (b['vote_average']).compareTo(a['vote_average']));

    setState(() {
      filmes.addAll(dados);
      filmesFiltrados = filmes;  // ✅ popular lista filtrada inicialmente
      pagina++;
    });
  }

  // ✅ Função filtrar
  void filtrarFilmes(String texto) {
    texto = texto.toLowerCase();

    setState(() {
      filmesFiltrados = filmes.where((filme) {
        final titulo = filme['title'].toLowerCase();
        return titulo.contains(texto);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filmes Populares",
          style: TextStyle(color: Colors.white), // ✅ título branco
        ),
        backgroundColor: Colors.black, // ✅ fundo preto
        iconTheme: IconThemeData(color: Colors.white), // ícones brancos
      ),

      body: Column(
        children: [
          // ✅ Caixa de busca
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: buscaController,
              onChanged: filtrarFilmes,
              decoration: InputDecoration(
                hintText: "Buscar filme...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // ✅ Listagem filtrada
          Expanded(
            child: filmesFiltrados.isEmpty
                ? Center(child: Text("Nenhum filme encontrado"))
                : ListView.builder(
                    itemCount: filmesFiltrados.length,
                    itemBuilder: (context, index) {
                      final filme = filmesFiltrados[index];
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
                        subtitle: Text("Nota: ⭐ ${filme['vote_average']}"),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
