import 'package:one_minute_english/src/screens/choose_level_and_themes_screen/view/choose_level_and_themes_screen_view.dart';
import 'package:one_minute_english/src/screens/main_app_menu_screen/view/main_app_menu_screen_view.dart';
import 'package:one_minute_english/src/screens/set_notification_screen/view/set_notification_screen_view.dart';
import 'package:one_minute_english/src/screens/subscrubtion_screen/view/subscribtion_screen_view.dart';
import 'package:one_minute_english/src/screens/subscrubtion_screen/view/subscription_screen_view_2.dart';
import 'package:one_minute_english/src/services/notifications_service.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/screens/start_screen/view/start_screen_view.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationsService().init();
  tz.initializeTimeZones();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const MainAppMenuScreenView(),
      routes: {
        const StartScreenView().route: (context) => const StartScreenView(),
        const ChooseLvlAndThemesScreenView().route: (context) =>
            const ChooseLvlAndThemesScreenView(),
      },
    );
  }
}
