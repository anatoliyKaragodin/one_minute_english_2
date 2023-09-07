import 'package:one_minute_english/src/repo/model/word.dart';

class Words {
  final List<Word> words;

//<editor-fold desc="Data Methods">
  const Words({
    required this.words,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Words &&
          runtimeType == other.runtimeType &&
          words == other.words);

  @override
  int get hashCode => words.hashCode;

  @override
  String toString() {
    return 'Words{' + ' words: $words,' + '}';
  }

  Words copyWith({
    List<Word>? words,
  }) {
    return Words(
      words: words ?? this.words,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'words': this.words,
    };
  }

  factory Words.fromMap(Map<String, dynamic> map) {
    return Words(
      words: map['words'] as List<Word>,
    );
  }

//</editor-fold>
}