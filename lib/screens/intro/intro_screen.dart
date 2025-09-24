import 'package:favorite_sport/data/user_settings_repository.dart';
import 'package:favorite_sport/routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final _isLastPage = _currentPage == _pages.length - 1;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final page = _pages[index];
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Expanded(
                        child: Lottie.asset(page['lottie']!, fit: BoxFit.contain,)),
                      Text(
                       page['title']!,
                       style: TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.bold,
                       ),
                      ),
                      SizedBox(height: 12,),
                      Text(
                        page['subtitle']!,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
              ),
            ),
            Visibility(
              visible: _isLastPage,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Checkbox(
                      value: _dontShowAgain,
                      onChanged: (val) {
                        setState(() {
                          _dontShowAgain = val ?? false;
                        });
                      }
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
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
  void _onBack() {
    if (_currentPage > 0) {
      _pageController.previousPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
      );
    }
  }
  Future<void> _finishIntro() async {
    await userSettingsRepository.setShowIntro(!_dontShowAgain);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, Routes.home);
    }
}



