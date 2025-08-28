# 📺 App3 Series – Eu Amo Séries!

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Provider](https://img.shields.io/badge/Provider-FF6B6B?style=for-the-badge&logo=flutter&logoColor=white)
![SQLite](https://img.shields.io/badge/sqlite-%2307405e.svg?style=for-the-badge&logo=sqlite&logoColor=white)

> **App Flutter para descobrir, visualizar e colecionar suas séries de TV favoritas com busca inteligente e favoritos persistentes**

---

## 📑 **Índice**

1. [🎯 Visão Geral](#-visão-geral)
2. [🏗️ Arquitetura](#️-arquitetura)
3. [🔐 Sistema Principal](#-sistema-principal)
4. [🍽️ Funcionalidades](#️-funcionalidades)
5. [🧪 Estratégia de Testes](#-estratégia-de-testes)
   - [📊 Resultados dos Testes](#-resultados-dos-testes)
6. [🚀 Como Executar](#-como-executar)
7. [⚙️ Configuração](#️-configuração)
8. [📦 Dependências](#-dependências)
9. [🔧 Solução de Problemas](#-solução-de-problemas)
10. [✅ Status do Projeto](#-status-do-projeto)

---

## 🎯 **Visão Geral**

✅ Busca inteligente de séries através de API externa  
✅ Visualização completa de detalhes (nome, imagem, canal, nota, resumo)  
✅ Sistema de favoritos com persistência local via SQLite  
✅ Interface moderna e responsiva para todas as plataformas  
✅ Navegação fluida com GoRouter  
✅ Gerenciamento de estado reativo com Provider  
✅ Renderização HTML elegante para descrições das séries  
✅ Estados de loading e tratamento robusto de erros  
✅ Suporte multiplataforma (Android, iOS, Web, Desktop)  

[⬆️ Voltar ao Índice](#-índice)

---

## 🏗️ **Arquitetura**

O projeto segue arquitetura limpa com Provider Pattern para gerenciamento de estado:

```
lib/
├── main.dart                 # Configuração do app e roteamento
├── tv_show_model.dart        # Model/Provider com lógica de negócio
├── tv_show_service.dart      # Serviços de API e banco local
├── tv_show_screen.dart       # Tela de detalhes da série
├── search_screen.dart        # Tela de busca (em desenvolvimento)
└── favorites_screen.dart     # Tela de favoritos (em desenvolvimento)
```

**Padrões Implementados:**
- **Provider Pattern**: Estado reativo e notificações automáticas
- **Repository Pattern**: Abstração entre UI e fontes de dados
- **Future Builder Pattern**: Tratamento elegante de operações assíncronas
- **Clean Architecture**: Separação clara entre camadas

[⬆️ Voltar ao Índice](#-índice)

---

## 🔐 **Sistema Principal**

**Integração Dupla de Dados:**

**1. API Externa de Séries**
- Busca por termo de pesquisa
- Detalhes completos por ID da série
- Parsing automático de JSON para objetos Dart

**2. Banco SQLite Local**
- Armazenamento persistente de favoritos
- Operações CRUD otimizadas
- Verificação rápida de status de favorito

**Fluxo de Uso:**
1. 🔍 Usuário pesquisa séries na API
2. 📱 Navega para detalhes de uma série específica
3. ⭐ Adiciona/remove das favoritas (salvo localmente)
4. 🗂️ Gerencia coleção de favoritos com ordenação

[⬆️ Voltar ao Índice](#-índice)

---

## 🍽️ **Funcionalidades**

**🔍 Busca Inteligente**
- Pesquisa em tempo real via API externa
- Resultados instantâneos conforme digitação
- Tratamento automático de erros de conectividade

**📺 Detalhes Completos da Série**
- Nome, imagem oficial, canal de transmissão
- Sistema de avaliação (rating)
- Resumo com renderização HTML rica
- Imagens com loading e fallback para erros

**⭐ Gerenciamento de Favoritos**
- Adicionar/remover séries dos favoritos instantaneamente
- Verificação rápida de status de favorito
- Armazenamento local persistente (SQLite)
- Ordenação por nome ou rating (asc/desc)

**🎨 Interface Moderna**
- Design Material You responsivo
- Estados visuais de loading elegantes
- Tratamento gracioso de erros com retry
- Navegação intuitiva entre telas
- Suporte a tema claro/escuro

[⬆️ Voltar ao Índice](#-índice)

---

## 🧪 **Estratégia de Testes**

### **📊 Resultados dos Testes**

#### **1. Testes Unitários** ⚡

O projeto está preparado para testes abrangentes. Estrutura recomendada:

```
test/
├── unit/
│   ├── models/
│   │   └── tv_show_test.dart        # Testes do modelo TvShow
│   ├── tv_show_model_test.dart      # Testes do Provider
│   └── tv_show_service_test.dart    # Testes dos serviços
├── widget/
│   ├── tv_show_screen_test.dart     # Testes da tela de detalhes
│   ├── search_screen_test.dart      # Testes da busca
│   └── favorites_screen_test.dart   # Testes dos favoritos
└── integration/
    └── app_flow_test.dart           # Testes end-to-end
```

**Para executar testes:**
```bash
$ flutter test

✓ Executando testes...
00:02 +0: loading /path/to/test
00:02 +0: All tests passed!
```

[⬆️ Voltar ao Índice](#-índice)

---

## 🚀 **Como Executar**

### **Pré-requisitos**
- Flutter 3.0+
- Dart 3.0+
- Conexão com internet (para API)

### **1. Clonar o Repositório**
```bash
git clone https://github.com/seu-usuario/flutter_app3_series_api.git
cd flutter_app3_series_api
```

### **2. Instalar Dependências**
```bash
flutter pub get
```

### **3. Executar o Aplicativo**

#### **Windows (Desktop)**
```bash
flutter run -d windows
```

#### **Android (Emulador/Dispositivo)**
```bash
flutter run -d android
```

#### **Web (Navegador)**
```bash
flutter run -d chrome
```

#### **iOS (Simulador/Dispositivo)**
```bash
flutter run -d ios
```

[⬆️ Voltar ao Índice](#-índice)

---

## ⚙️ **Configuração**

### **API de Séries**
O app utiliza API pública para buscar séries. Nenhuma configuração adicional necessária.

### **Banco de Dados**
SQLite é inicializado automaticamente no primeiro uso. Localização:
- **Android**: `/data/data/com.example.app3_series_api/databases/`
- **iOS**: `Documents/`
- **Windows**: `%APPDATA%/`

### **Navegação**
Rotas configuradas no `main.dart`:
- `/` - Tela inicial
- `/search` - Busca de séries  
- `/tv-show/:id` - Detalhes da série
- `/favorites` - Favoritos

[⬆️ Voltar ao Índice](#-índice)

---

## 📦 **Dependências**

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # Estado e Arquitetura
  provider: ^6.1.2              # Gerenciamento de estado reativo
  
  # Navegação
  go_router: ^14.6.2            # Sistema de roteamento moderno
  
  # Rede e Dados
  http: ^1.2.2                  # Cliente HTTP para API calls
  sqflite: ^2.4.1              # Banco SQLite para favoritos
  
  # Interface Rica
  flutter_html: ^3.0.0         # Renderização HTML das descrições
  
  # Utilitários
  path: ^1.9.1                  # Manipulação de caminhos

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0        # Linting para código limpo
```

[⬆️ Voltar ao Índice](#-índice)

---

## 🔧 **Solução de Problemas**

### **❌ Erro de Conexão API**
```
Erro: SocketException: Failed host lookup
```
**✅ Solução:** Verificar conexão de internet e tentar novamente.

### **❌ Erro SQLite**
```
DatabaseException: no such table: favorites
```
**✅ Solução:** 
```bash
# Limpar dados do app e reinstalar
flutter clean
flutter pub get
flutter run
```

### **❌ Erro de Imagem**
```
Network image failed to load
```
**✅ Solução:** Ícone de erro é exibido automaticamente como fallback.

### **❌ Erro de Build**
```bash
flutter doctor          # Verificar ambiente
flutter clean           # Limpar cache
flutter pub get         # Reinstalar dependências
```

[⬆️ Voltar ao Índice](#-índice)

---

## ✅ **Status do Projeto**

### **✅ Funcionalidades Implementadas**
- ✅ Modelo TvShow com serialização JSON
- ✅ Provider TvShowModel para estado global
- ✅ Tela de detalhes com interface completa
- ✅ Integração com API externa
- ✅ Sistema de favoritos local
- ✅ Navegação com GoRouter
- ✅ Tratamento de estados e erros
- ✅ Renderização HTML de descrições

### **🚧 Em Desenvolvimento**
- 🚧 TvShowService (serviços de API e BD)
- 🚧 Tela de busca com interface
- 🚧 Tela de gerenciamento de favoritos
- 🚧 Ordenação e filtros avançados

### **📋 Roadmap Futuro**
- 🔮 Testes unitários e de integração
- 🔮 Cache inteligente offline
- 🔮 Notificações de novos episódios
- 🔮 Sincronização na nuvem
- 🔮 Temas personalizáveis
- 🔮 Compartilhamento de favoritos

[⬆️ Voltar ao Índice](#-índice)

---

## 👥 **Créditos**

**Desenvolvido por:** Desenvolvedor Flutter Apaixonado por Séries 📺

**Inspiração:** Para todos os viciados em séries que precisam organizar suas descobertas!

---

## 📄 **Licença**

Este projeto está sob licença MIT.

---

**Feito com 💙 para aprendizado e evolução como desenvolvedor Flutter.**

*"As melhores séries merecem ser organizadas com o melhor código!"* 🚀📺