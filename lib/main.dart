import 'package:one_minute_english/src/screens/choose_level_and_themes_screen/view/choose_level_and_themes_screen_view.dart';
import 'package:one_minute_english/src/screens/main_menu_progress_screen/view/widgets/my_calendar.dart';
import 'package:one_minute_english/src/services/notifications_service.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/screens/start_screen/view/start_screen_view.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:timezone/data/latest.dart' as tz;

Brightness systemBrightness = Brightness.light;
bool isDarkTheme = false;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationsService().init();
  tz.initializeTimeZones();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  systemBrightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;
  isDarkTheme = systemBrightness == Brightness.dark ? true : false;
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
      home: const MyCalendar(),
      routes: {
        const StartScreenView().route: (context) => const StartScreenView(),
        const ChooseLvlAndThemesScreenView().route: (context) =>
            const ChooseLvlAndThemesScreenView(),
      },
    );
  }
}
