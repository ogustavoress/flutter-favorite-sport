import 'dart:convert';

import 'package:favorite_sport/model/Sport.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettingsRepository {
  static const _key = 'favorite_team';

  Future<Sport?> getSport() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_key);

    if(jsonStr == null) {
      return null;
    }
    try {
      final map = jsonDecode(jsonStr) as Map<String, dynamic>;
      return Sport.fromJson(map);
    }
    catch(_) {
      return null;
    }
  }

  Future<void> setSport(Sport sport) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(sport.toJson()));
  }

  Future<void> clearSport() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}