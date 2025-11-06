# 🎬 Movie App – Flutter

Aplicativo desenvolvido em **Flutter** para exibir filmes populares consumindo a API REST do The Movie Database (TMDb).  
O app lista filmes, permite buscar por nome, visualizar detalhes e adicionar aos favoritos.

---

## 📁 Estrutura de Pastas
lib/<br>
├── main.dart // Define as rotas <br>
├── services/<br>
│ └── api_service.dart // Responsável pelo consumo da API<br>
├── pages/<br>
│ ├── filmes_page.dart // Lista e busca de filmes<br>
│ ├── detalhes_page.dart // Tela de detalhes do filme<br>
│ └── favoritos_page.dart // Lista de filmes marcados como favoritos <br>


---

## 🚀 Funcionalidades

✅ Consumir API REST com pacote `http`  
✅ Listar filmes populares  
✅ Ordenação por melhor nota  
✅ Buscar filmes pelo nome  
✅ Tela de detalhes com imagem, sinopse e avaliação  
✅ Sistema de favoritos armazenando no estado do app  
✅ Navegação entre telas usando `Navigator`  
✅ Layout organizado com Column, Row, ListView e Image.network

---

## 🛠 Tecnologias Utilizadas

- **Flutter**
- **Dart**
- **HTTP para requisições REST**
- **Material Design**
- **StatefulWidgets** e `setState`

---

## 🖼 Prévia do Aplicativo

| Tela | Preview |
|------|---------|
| Tela Inicial | *([Ver Imagem](https://raw.githubusercontent.com/claudioreisjr/app-flutter/refs/heads/main/inicio.PNG))* |
| Tela de Detalhes | *([Ver Imagem](https://raw.githubusercontent.com/claudioreisjr/app-flutter/refs/heads/main/detalhes.PNG))* |
| Tela de Favoritos | *([Ver Imagem](https://raw.githubusercontent.com/claudioreisjr/app-flutter/refs/heads/main/favoritos.PNG))* |

## ✅ Conceitos do Flutter aplicados

- `Scaffold`, `AppBar`, `BottomNavigationBar`
- `Column`, `Row`, `Expanded`
- `ListView.builder` para renderização dinâmica
- `TextField` com filtro da lista
- `Navigator.push()` para navegar para Detalhes
- `setState()` para atualizar o estado da interface
- Requisições HTTP assíncronas (`async`, `await`)

---

## 📌 Como rodar o projeto

```bash
flutter pub get
flutter run
