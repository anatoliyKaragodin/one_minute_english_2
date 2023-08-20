import 'package:one_minute_english/src/screens/choose_level_and_themes_screen/view/choose_level_and_themes_screen_view.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/screens/start_screen/model/start_screen_model.dart';

import '../model/start_screen.dart';

final startScreenProvider =
    StateNotifierProvider<StartScreenModel, StartScreen>((ref) {
  return StartScreenModel();
});

class StartScreenController {
  static void onLanguageTap(WidgetRef ref, int index) {
    ref.read(startScreenProvider.notifier).setChosenLangIndex(index);
  }

  static void onNextButtonTap(WidgetRef ref, BuildContext context) async {
    final pageIndex = ref.read(startScreenProvider).startPageIndex;
    if (pageIndex < 4) {
      ref.read(startScreenProvider.notifier).changePageOpacity();
      await Future.delayed(const Duration(milliseconds: 500));
      ref.read(startScreenProvider.notifier).increasePageIndex();
      await Future.delayed(const Duration(milliseconds: 500));
      ref.read(startScreenProvider.notifier).changePageOpacity();
    } else {
      Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ChooseLvlAndThemesScreenView();
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

  static void onSkipTap(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return const ChooseLvlAndThemesScreenView();
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
