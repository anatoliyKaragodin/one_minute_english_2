import 'package:one_minute_english/src/repo/model/word.dart';

class Words {
  final List<Word> words;
 final List<Word> selectedToLearn;
 final List<Word> alreadyKnown;
final List<int> allThemes;
final List<int> selectedThemes;
final int currentWord;

//<editor-fold desc="Data Methods">
  const Words({
    required this.words,
    required this.selectedToLearn,
    required this.alreadyKnown,
    required this.allThemes,
    required this.selectedThemes,
    required this.currentWord,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Words &&
          runtimeType == other.runtimeType &&
          words == other.words &&
          selectedToLearn == other.selectedToLearn &&
          alreadyKnown == other.alreadyKnown &&
          allThemes == other.allThemes &&
          selectedThemes == other.selectedThemes &&
          currentWord == other.currentWord);

  @override
  int get hashCode =>
      words.hashCode ^
      selectedToLearn.hashCode ^
      alreadyKnown.hashCode ^
      allThemes.hashCode ^
      selectedThemes.hashCode ^
      currentWord.hashCode;

  @override
  String toString() {
    return 'Words{' +
        ' words: $words,' +
        ' selectedToLearn: $selectedToLearn,' +
        ' alreadyKnown: $alreadyKnown,' +
        ' allThemes: $allThemes,' +
        ' selectedThemes: $selectedThemes,' +
        ' currentWord: $currentWord,' +
        '}';
  }

  Words copyWith({
    List<Word>? words,
    List<Word>? selectedToLearn,
    List<Word>? alreadyKnown,
    List<int>? allThemes,
    List<int>? selectedThemes,
    int? currentWord,
  }) {
    return Words(
      words: words ?? this.words,
      selectedToLearn: selectedToLearn ?? this.selectedToLearn,
      alreadyKnown: alreadyKnown ?? this.alreadyKnown,
      allThemes: allThemes ?? this.allThemes,
      selectedThemes: selectedThemes ?? this.selectedThemes,
      currentWord: currentWord ?? this.currentWord,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'words': this.words,
      'selectedToLearn': this.selectedToLearn,
      'alreadyKnown': this.alreadyKnown,
      'allThemes': this.allThemes,
      'selectedThemes': this.selectedThemes,
      'currentWord': this.currentWord,
    };
  }

  factory Words.fromMap(Map<String, dynamic> map) {
    return Words(
      words: map['words'] as List<Word>,
      selectedToLearn: map['selectedToLearn'] as List<Word>,
      alreadyKnown: map['alreadyKnown'] as List<Word>,
      allThemes: map['allThemes'] as List<int>,
      selectedThemes: map['selectedThemes'] as List<int>,
      currentWord: map['currentWord'] as int,
    );
  }

//</editor-fold>
}