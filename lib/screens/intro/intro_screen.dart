import 'package:favorite_sport/data/user_settings_repository.dart';
import 'package:favorite_sport/routes.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  final List<Map<String, String>> _pages = [
    {
      'title': 'Seja bem-vindo ao App',
      'subtitle': 'Aqui você acompanha tudo sobre o seu esporte favorito.',
      'lottie': 'assets/lottie/intro1.json'
    },
    {
      'title': 'Escolha o esporte',
      'subtitle': 'Selecione o seu esporte favorito para saber mais.',
      'lottie': 'assets/lottie/intro2.json'
    },
    {
      'title': 'Boa escolha!',
      'subtitle': ''
          'Fique por entro das novidades do seu esporte favorito.',
      'lottie': 'assets/lottie/intro3.json'
    },
  ];

  final userSettingsRepository = UserSettingsRepository();

  final PageController _pageController = PageController();

  int _currentPage = 0;
  bool _dontShowAgain = false;

  void _onNext(){
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn
      );
    } else {
      _finishIntro();
    }
  }
  Future<void> _finishIntro() async {
    await userSettingsRepository.setShowIntro(!_dontShowAgain);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, Routes.home);
    }
}



