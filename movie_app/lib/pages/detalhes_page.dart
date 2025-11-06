import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class DetalhesPage extends StatelessWidget {
  final Map filme;

  DetalhesPage(this.filme);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(filme['title'])),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                "https://image.tmdb.org/t/p/w300${filme['poster_path']}",
              ),
            ),
            SizedBox(height: 20),
            Text(
              filme['title'],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Nota: ${filme['vote_average']}"),
            SizedBox(height: 10),
            Text(
              filme['overview'],
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
