import 'package:favorite_sport/screens/home/home_screen.dart';
import 'package:favorite_sport/screens/select/select_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = '/';
  static const String intro = '/intro';
  static const String select = '/select';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case select:
        return MaterialPageRoute(builder: (_) => SelectScreen());
      default:
        return MaterialPageRoute(builder: (_) =>
          Scaffold(
            body: Center(
              child: Text('Rota não encontrada!'),
            )
          )
        );
    }
  }
}