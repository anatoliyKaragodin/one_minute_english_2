import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minute_english/src/repo/db/db_helper.dart';
import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/repo/model/words.dart';

class WordsModel extends StateNotifier<Words> {
  WordsModel() : super(const Words(words: [])) {initState();}

  void initState() async {
    var wordsByTheme = await DatabaseHelper.instance.getWordsByTheme('Beginner', 'russian');
    state = state.copyWith(words: wordsByTheme);
  }
}