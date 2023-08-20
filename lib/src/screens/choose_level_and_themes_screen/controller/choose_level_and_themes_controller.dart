import 'package:one_minute_english/src/screens/choose_level_and_themes_screen/model/choose_level_and_themes.dart';
import 'package:one_minute_english/src/screens/choose_level_and_themes_screen/model/choose_level_and_themes_screen_model.dart';
import 'package:one_minute_english/src/screens/set_notification_screen/view/set_notification_screen_view.dart';
import 'package:one_minute_english/src/utils/library.dart';

final chooseLevelAndThemesProvider = StateNotifierProvider<
    ChooseLevelAndThemesScreenModel, ChooseLevelAndThemes>((ref) {
  return ChooseLevelAndThemesScreenModel();
});

class ChooseLevelAndThemesController {
  static void onTapTheme(WidgetRef ref, int index) {
    final listOfThemes =
        ref.read(chooseLevelAndThemesProvider).listOfSelectedThemes;
    if (listOfThemes.contains(index)) {
      if (index == 0) {
        for (int i = 1; i < 21; i++) {
          listOfThemes.remove(i);
        }
      }
      listOfThemes.remove(index);
    } else {
      if (index == 0) {
        for (int i = 1; i < 21; i++) {
          if (!listOfThemes.contains(i)) {
            listOfThemes.add(i);
          }
        }
      }
      listOfThemes.add(index);
    }
    ref.read(chooseLevelAndThemesProvider.notifier).setThemesList(listOfThemes);
  }

  static onNextTap(BuildContext context, WidgetRef ref) {
    final listOfThemes =
        ref.read(chooseLevelAndThemesProvider).listOfSelectedThemes;
    if (listOfThemes.any((element) => [1, 2, 3, 4, 5].contains(element))) {
      Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SetNotificationScreenView();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      );
    }
  }
}
