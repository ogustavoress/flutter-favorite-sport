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

  final userSettingsRepository = UserSettingsRepository();
  final sportsRepository = SportsRepository();

  late Future<List<Sport>> _sportsFuture;
  List<Sport> _allSports = [];
  List<Sport> _filteredSports = [];

  @override
  void initState() {
    super.initState();
    _sportsFuture = sportsRepository.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha seu esporte'),
      ),
      body: FutureBuilder<List<Sport>>(
        future: _sportsFuture,
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
          if (_allSports.isEmpty) {
            _allSports = sports;
            _filteredSports = sports;
          }
          return Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Buscar time",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _filteredSports = _allSports.where((sport) => sport.name
                                .toLowerCase().contains(value.toLowerCase()))
                                .toList();
                      });
                    },
                  ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: _filteredSports.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final s = _filteredSports[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () async {
                          await userSettingsRepository.setSport(s);
                          if (context.mounted)
                            Navigator.pop(context);
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Image.asset(
                                s.logo,
                                width: 56,
                                height: 56,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                  child: Text(s.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                  ),
                                  )
                              ),
                              const Icon(Icons.chevron_right),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
