# Flutter Favorite Sport

Aplicativo desenvolvido em **Flutter** para gerenciar a tela de introdução (onboarding) e a seleção de um esporte favorito, utilizando **SharedPreferences** para persistência local dos dados do usuário.

## Funcionalidades

- Exibe uma **tela de introdução** (IntroScreen) com animações Lottie.
- Permite escolher se o usuário deseja ou não visualizar a introdução novamente (`Checkbox` com persistência).
- Armazena o **esporte favorito** selecionado pelo usuário em `SharedPreferences`.
- Navegação com botões:
    - **Avançar** → percorre as telas de introdução.
    - **Voltar** → disponível a partir da segunda tela.
    - **Concluir** → finaliza a introdução.
- Estrutura de código organizada para futuras expansões.

## Tecnologias Utilizadas

- [Flutter](https://flutter.dev) (SDK mais recente)
- [Dart](https://dart.dev)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [lottie](https://pub.dev/packages/lottie)

## Estrutura do Projeto
```
lib/
├── main.dart # Arquivo principal
├── screens/
│ └── intro/intro_screen.dart # Tela de introdução
├── models/
│ └── sport.dart # Modelo para esporte favorito
└── services/
└── preferences_service.dart # Serviço para persistência local
```

## Como Executar

1. Certifique-se de ter o [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado.
2. Clone este repositório:
   ```
   git clone https://github.com/ogustavoress/flutter-favorite-sport.git
   ```
3. Acesse a pasta do projeto
   ```
   cd flutter-favorite-sport
   ```
4. Instale as dependências
   ```
   flutter pub get
   ```
5. Execute no emulador ou dispositivo físico
    ```
   flutter run
   ```
6. Para rodar os testes automatizados
    ```
   flutter test
   ```


