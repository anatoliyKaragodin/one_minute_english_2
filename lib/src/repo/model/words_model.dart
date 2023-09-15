import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minute_english/src/repo/db/db_helper.dart';
import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/repo/model/words.dart';

class WordsModel extends StateNotifier<Words> {
  WordsModel()
      : super(const Words(
            words: [],
            selectedToLearn: [],
            alreadyKnown: [],
            selectedThemes: [],
            allThemes: [],
            currentWord: 0)) {
    initState();
  }

  void initState() async {
    var wordsByTheme =
        await DatabaseHelper.instance.getWordsByTheme('Beginner', 'russian');
    state = state.copyWith(words: wordsByTheme);
  }

  void addAlreadyKnownWord(Word word) {
    List<Word> alreadyKnownWords = List.from(state.alreadyKnown);
    alreadyKnownWords.add(word);
    state = state.copyWith(alreadyKnown: alreadyKnownWords);
    setNextCurrentWordIndex();

  }

  void addToLearnWord(Word word) {
    List<Word> toLearnWords = List.from(state.selectedToLearn);
    toLearnWords.add(word);
    state = state.copyWith(selectedToLearn: toLearnWords);
    setNextCurrentWordIndex();
  }

  void setNextCurrentWordIndex() {
    if(state.currentWord<state.words.length) {
      state=state.copyWith(currentWord: state.currentWord+1);
    }
  }
}
