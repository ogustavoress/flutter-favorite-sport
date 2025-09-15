import 'package:favorite_sport/data/sports_repository.dart';
import 'package:favorite_sport/data/user_settings_repository.dart';
import 'package:favorite_sport/model/Sport.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  @override
  Widget build(BuildContext context) {

    final userSettingsRepository = UserSettingsRepository();
    final sportsRepository = SportsRepository();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha seu esporte'),
      ),
      body: FutureBuilder<List<Sport>>(
        future: sportsRepository.load(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar esportes'),
            );
          }
          final sports = snapshot.data ?? [];
          if (sports.isEmpty) {
            return const Center(
              child: Text('Nenhum esporte encontrado'),
            );
          }
        },
      ),
    );
  }
}
