import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritosService {
  static const String chave = 'favoritos';

  static Future<void> salvarFavorito(Map filme) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> lista = prefs.getStringList(chave) ?? [];

    // Evitar duplicados
    if (!lista.contains(json.encode(filme))) {
      lista.add(json.encode(filme));
      await prefs.setStringList(chave, lista);
    }
  }


  static Future<List<Map>> getFavoritos() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? lista = prefs.getStringList(chave) ?? [];
    return lista.map((item) => json.decode(item) as Map).toList();
  }
}
