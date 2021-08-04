import 'package:flutter/material.dart';
import 'package:language_change_app/localization/demo_localizatons.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String langCode = 'langCode';

//languages code
const String english = 'en';
const String arabic = 'ar';
const String hindi = 'hi';
const String tamil = 'ta';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(langCode, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(langCode) ?? "en";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case english:
      return const Locale(english, 'US');
    case arabic:
      return const Locale(arabic, "SA");
    case hindi:
      return const Locale(hindi, "IN");
    case tamil:
      return const Locale(tamil, "IN");
    default:
      return const Locale(english, 'US');
  }
}

String? getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context)!.translate(key);
}
