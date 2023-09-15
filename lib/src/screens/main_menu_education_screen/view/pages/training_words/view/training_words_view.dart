import 'package:one_minute_english/src/repo/model/words_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/training_words_read_words_widget.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/training_words_select_translation_widget.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/training_words_top_container.dart';
import 'package:one_minute_english/src/screens/main_menu_settings/controller/settings_controller.dart';
import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_color_button.dart';

class TrainingWordsView extends ConsumerStatefulWidget {
  const TrainingWordsView({super.key});
  final route = 'training words page';

  @override
  ConsumerState createState() => _TrainingWordsViewState();
}

class _TrainingWordsViewState extends ConsumerState<TrainingWordsView> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    final words = ref.watch(wordsProvider);
    final settings = ref.watch(settingsProvider);
    final centerWidgetsList = [
      TrainingWordsReadWordsWidget(
          text: lang[LangKey.readTheseWordsCarefully]!,
          listOfWords: words.selectedToLearn),
      TrainingWordsSelectTranslationWidget(
        listOfWords: words.selectedToLearn,
        text: lang[LangKey.selectTranslation]!,
        currentWordIndex: 0,
      )
    ];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TrainingWordsTopContainer(
            text: lang[LangKey.training]!,
            progress: 0.2,
          ),
          Expanded(child:
              PageView.builder(itemBuilder: (BuildContext context, int index) {
            return centerWidgetsList[1];
          })),
          Padding(
            padding: EdgeInsets.only(bottom: myParameters.pixelHeight * 50),
            child: MyColorButtonWidget(
                func: () {}, text: lang[LangKey.nextButton]!),
          )
        ],
      ),
    );
  }
}
