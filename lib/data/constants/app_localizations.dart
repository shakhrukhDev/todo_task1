import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

extension Translator on String {
  String get tr {
    return AppLocalizations.instance.translate(this);
  }
}

class AppLocalizations {
  AppLocalizations._();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        instance;
  }

  static AppLocalizations get instance => AppLocalizations._();
  static Map<String, dynamic> _localizedValues = {};

  String translate(String key) {
    if (_localizedValues.isNotEmpty) {
      return _localizedValues[key] ?? '* $key';
    }
    return '';
  }

  static Future<AppLocalizations> load(Locale locale) async {
    String jsonContent = await rootBundle.loadString(
      "assets/locale/${locale.languageCode}.json",
    );
    _localizedValues = jsonDecode(jsonContent);
    return instance;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  TranslationsDelegate();
}

class TranslationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['ru', 'uz', 'en', 'oz'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return await SynchronousFuture<AppLocalizations>(
      await AppLocalizations.load(locale),
    );
  }

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}