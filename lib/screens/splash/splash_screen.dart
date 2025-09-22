import 'package:favorite_sport/data/user_settings_repository.dart';
import 'package:favorite_sport/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
    _SplashScreenState();
  }

class _SplashScreenState extends State<SplashScreen> {
  final userSettingsRepository = UserSettingsRepository();
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    final showIntro = await userSettingsRepository.getShowIntro();
      if (!mounted) return;
      if (showIntro) {
        Navigator.pushReplacementNamed(context, Routes.intro);
      } else {
        Navigator.pushReplacementNamed(context, Routes.home);
      }
  }
}