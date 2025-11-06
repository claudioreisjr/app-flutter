import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String key = "2b3d876bb35f1fc9f96a96b9575103aa";

  static Future<List> getFilmes(int pagina) async {
    final url = Uri.parse(
      "https://api.themoviedb.org/3/movie/popular?api_key=$key&language=pt-BR&page=$pagina"
    );

    final resposta = await http.get(url);

    if (resposta.statusCode == 200) {
      final dados = json.decode(resposta.body);
      return dados["results"];
    } else {
      throw Exception("Erro ao buscar filmes");
    }
  }
}
