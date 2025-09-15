import 'package:favorite_sport/data/user_settings_repository.dart';
import 'package:favorite_sport/model/Sport.dart';
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
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
