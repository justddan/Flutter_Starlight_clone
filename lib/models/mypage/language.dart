class LanguageSetting {
  final String language, title;
  final int languageId;

  LanguageSetting({
    required this.language,
    required this.title,
    required this.languageId,
  });
}

List<LanguageSetting> languages = [
  LanguageSetting(
    language: "English",
    languageId: 0,
    title: "EN",
  ),
  LanguageSetting(
    language: "Language 2",
    languageId: 1,
    title: "L2",
  ),
  LanguageSetting(
    language: "Language 3",
    languageId: 2,
    title: "L3",
  ),
];
