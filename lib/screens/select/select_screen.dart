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

        },
      ),
    );
  }
}
