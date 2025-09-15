import 'package:favorite_sport/data/user_settings_repository.dart';
import 'package:favorite_sport/model/Sport.dart';
import 'package:favorite_sport/routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final userSettingsRepository = UserSettingsRepository();

  Future<Sport?>?_future;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() {
    _future = userSettingsRepository.getSport();
  }

  Future<void> _goSelect() async {
    await Navigator.pushNamed(context, Routes.select);
    setState(_reload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Esporte Favorito'),
        actions: [
          IconButton(
            tooltip: 'Trocar time',
            icon: const Icon(Icons.swap_horiz),
            onPressed: _goSelect,
          )
        ]
      ),
      body: FutureBuilder<Sport?>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final sport = snapshot.data;
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    Card(
                      elevation: 2,
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: _goSelect,
                        child: Stack(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      sport == null
                          ? 'Você ainda não escolheu seu esporte favorito. \nClique na imagem acima'
                          : sport.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
          );
        },

      ),
    );
  }
}
