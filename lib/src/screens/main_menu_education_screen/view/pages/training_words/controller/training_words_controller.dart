import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/training_words_translation_result._dialog.dart';
import 'package:one_minute_english/src/utils/library.dart';

class TrainingWordsController {
  static void onTapTranslation(
      BuildContext context, int index, int currentWordIndex) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return TrainingWordsTranslationResultDialog(
            answerIndex: currentWordIndex,
            yourIndex: index,
          );
        });
  }
}
