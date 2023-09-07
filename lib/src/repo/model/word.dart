class Word {
  final int englishId;
  final String word;
  final String transcription;
  final String theme;
  final String level;
  final String translation;
  final String language;
  final String soundPath;
  final String imgPath;

//<editor-fold desc="Data Methods">
  const Word({
    required this.englishId,
    required this.word,
    required this.transcription,
    required this.theme,
    required this.level,
    required this.translation,
    required this.language,
    required this.soundPath,
    required this.imgPath,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          runtimeType == other.runtimeType &&
          englishId == other.englishId &&
          word == other.word &&
          transcription == other.transcription &&
          theme == other.theme &&
          level == other.level &&
          translation == other.translation &&
          language == other.language &&
          soundPath == other.soundPath &&
          imgPath == other.imgPath);

  @override
  int get hashCode =>
      englishId.hashCode ^
      word.hashCode ^
      transcription.hashCode ^
      theme.hashCode ^
      level.hashCode ^
      translation.hashCode ^
      language.hashCode ^
      soundPath.hashCode ^
      imgPath.hashCode;

  @override
  String toString() {
    return 'Word{' +
        ' englishId: $englishId,' +
        ' word: $word,' +
        ' transcription: $transcription,' +
        ' theme: $theme,' +
        ' level: $level,' +
        ' translation: $translation,' +
        ' language: $language,' +
        ' soundPath: $soundPath,' +
        ' imgPath: $imgPath,' +
        '}';
  }

  Word copyWith({
    int? englishId,
    String? word,
    String? transcription,
    String? theme,
    String? level,
    String? translation,
    String? language,
    String? soundPath,
    String? imgPath,
  }) {
    return Word(
      englishId: englishId ?? this.englishId,
      word: word ?? this.word,
      transcription: transcription ?? this.transcription,
      theme: theme ?? this.theme,
      level: level ?? this.level,
      translation: translation ?? this.translation,
      language: language ?? this.language,
      soundPath: soundPath ?? this.soundPath,
      imgPath: imgPath ?? this.imgPath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'englishId': this.englishId,
      'word': this.word,
      'transcription': this.transcription,
      'theme': this.theme,
      'level': this.level,
      'translation': this.translation,
      'language': this.language,
      'soundPath': this.soundPath,
      'imgPath': this.imgPath,
    };
  }

  factory Word.fromMap(Map<String, dynamic> map) {
    return Word(
      englishId: map['englishId'] as int,
      word: map['word'] as String,
      transcription: map['transcription'] as String,
      theme: map['theme'] as String,
      level: map['level'] as String,
      translation: map['translation'] as String,
      language: map['language'] as String,
      soundPath: map['soundPath'] as String,
      imgPath: map['imgPath'] as String,
    );
  }

//</editor-fold>
}
