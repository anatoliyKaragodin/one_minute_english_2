class DbConstants {
  static const databaseName = "words_database.db";
  static const databaseVersion = 1;

  static const table = 'words';
  static const columnId = 'id';
  static const columnName = 'word';
  static const columnPronunciation = 'transcription';
  static const columnLevel = 'level';
  static const columnCategory = 'theme';

  static const tableTranslations = 'translations';
  static const columnTranslation = 'translation';
  static const columnLanguage = 'language';
  static const columnEnglishId = 'english_id';
}