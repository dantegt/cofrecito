import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static String _summoner = '';
  static String _server = 'LAS';
  static String _rank = '';
  static String _icon = '';
  static int _level = 0;
  static bool _darkmode = true;
  static bool _isLogged = false;

  static late SharedPreferences _prefs;

  // Getters
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get summoner {
    return _prefs.getString('_summoner') ?? _summoner;
  }

  static String get server {
    return _prefs.getString('_server') ?? _server;
  }

  static String get rank {
    return _prefs.getString('_rank') ?? _rank;
  }

  static String get icon {
    return _prefs.getString('_icon') ?? _icon;
  }

  static int get level {
    return _prefs.getInt('_level') ?? _level;
  }

  static bool get darkmode {
    return _prefs.getBool('_darkmode') ?? _darkmode;
  }

  static bool get isLogged {
    return _prefs.getBool('_isLogged') ?? _isLogged;
  }

  // Setters
  static set summoner(String value) {
    _summoner = value;
    _prefs.setString('summoner', value);
  }

  static set server(String value) {
    _server = value;
    _prefs.setString('server', value);
  }

  static set rank(String value) {
    _rank = value;
    _prefs.setString('rank', value);
  }

  static set icon(String value) {
    _icon = value;
    _prefs.setString('icon', value);
  }

  static set level(int value) {
    _level = value;
    _prefs.setInt('level', value);
  }

  static set darkmode(bool value) {
    _darkmode = value;
    _prefs.setBool('darkmode', value);
  }

  static set isLogged(bool value) {
    _isLogged = value;
    _prefs.setBool('isLogged', value);
  }
}
