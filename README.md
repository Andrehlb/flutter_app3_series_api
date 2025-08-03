# 📺 flutter_app3_series_api

Projeto Flutter que consome a API TV Maze e exibe uma lista de séries.  
Em breve, funcionalidades como **buscar**, **favoritar** e **organizar por categorias** serão implementadas.

---

## 🚀 Tecnologias Utilizadas

- Flutter
- Dart
- API REST (TV Maze)
- Gerenciamento de estado com `setState` (⚙️ migração para `Provider` em andamento)
- `http` package
- Widgets personalizados
- SQLite (⚠️ em testes)

---

## 🧱 Estrutura do Projeto

### `main.dart`
Arquivo principal que inicia o app e define a tela inicial como `TvShowScreen`.

### `tv_show_screen.dart`
Exibe uma lista básica de séries consumidas da API, usando `TvShowService`.

### `tv_show_service.dart`
Responsável por acessar a API do TV Maze e transformar os dados recebidos em objetos `TvShowModel`.

### `tv_show_model.dart`
Define o modelo `TvShowModel` com `id`, `name`, `image` e o `factory constructor` `fromJson()`.

---

## 🧪 Em desenvolvimento (em breve)

- Tela de favoritos com SQLite
- Provider para gerenciamento de estado
- Drawer lateral com navegação entre telas
- Busca de séries por nome

---

## 📸 Capturas de Tela

> ⚠️ Em construção – imagens serão adicionadas assim que as telas estiverem completas.

---

## 📂 Organização da pasta `/lib/`

```bash
/lib
 ├── main.dart
 ├── tv_show_screen.dart
 ├── tv_show_service.dart
 └── tv_show_model.dart
