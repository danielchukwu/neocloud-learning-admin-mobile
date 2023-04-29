enum LanguageType {
  English,
  Igbo,
  Hausa,
  Yoruba,
  Espanol,
  Francais,
  Italiano,
  Portugues,
}

class Language {
  static LanguageType selected = LanguageType.English;
  static int length = LanguageType.values.length;
}