import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiService {
  static const String baseUrl = "https://api.themoviedb.org/3/movie/popular?api_key=2b3d876bb35f1fc9f96a96b9575103aa&language=pt-BR";

  static Future<List> getFilmes() async {
    final url = Uri.parse(baseUrl);
    final resposta = await http.get(url);

    if (resposta.statusCode == 200) {
      final dados = json.decode(resposta.body);
      return dados["results"]; // Lista de filmes
    } else {
      throw Exception("Erro ao buscar filmes");
    }
  }
}
