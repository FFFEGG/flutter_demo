import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class LocalizationDemo {
  final Locale local;

  LocalizationDemo(this.local);

  static Map<String, Map<String, String>> _localized = {
    'en': {'title': 'hello'},
    'zh': {'title': '你好'}
  };

  String get title {
    return _localized[local.languageCode]['title'];
  }
}

class LocalizationDemoDelegate extends LocalizationsDelegate<LocalizationDemo> {


  LocalizationDemoDelegate();

  @override
  Future<LocalizationDemo> load(Locale locale) {
    return SynchronousFuture<LocalizationDemo>(LocalizationDemo(locale));
  }

  @override
  bool isSupported(Locale locale) {
    return true;
  }


  @override
  bool shouldReload(LocalizationsDelegate<LocalizationDemo> old) {
    return false;
  }
}
