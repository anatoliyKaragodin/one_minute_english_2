import 'package:one_minute_english/src/repo/db/db_helper.dart';
import 'package:one_minute_english/src/screens/choose_level_and_themes_screen/view/choose_level_and_themes_screen_view.dart';
import 'package:one_minute_english/src/screens/main_app_menu_screen/view/main_app_menu_screen_view.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/select_words_to_learn_page/view/select_words_to_learn.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/training_words_view.dart';
import 'package:one_minute_english/src/services/notifications_service.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/screens/start_screen/view/start_screen_view.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:timezone/data/latest.dart' as tz;

Brightness systemBrightness = Brightness.light;
bool isDarkTheme = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationsService().init();
  tz.initializeTimeZones();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  systemBrightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;
  isDarkTheme = systemBrightness == Brightness.dark ? true : false;
  await DatabaseHelper.instance.database;
  var words = await DatabaseHelper.instance.getWordsByTheme("Beginner", 'russian');
  debugPrint(words[10].imgPath.toString());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:
            isDarkTheme ? MyColors.blackColor87 : MyColors.whiteColor,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, brightness: systemBrightness),
        useMaterial3: false,
      ),
      home: const SelectWordsToLearnPage(),
      routes: {
        const StartScreenView().route: (context) => const StartScreenView(),
        const ChooseLvlAndThemesScreenView().route: (context) =>
            const ChooseLvlAndThemesScreenView(),
      },
    );
  }
}
