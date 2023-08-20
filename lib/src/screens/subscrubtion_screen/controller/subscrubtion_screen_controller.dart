import 'package:one_minute_english/src/screens/subscrubtion_screen/view/widgets/subscription_dialog_widget.dart';
import 'package:one_minute_english/src/screens/subscrubtion_screen/view/subscription_screen_view_2.dart';
import 'package:one_minute_english/src/utils/library.dart';

class SubscriptionScreenController {
  static onNextTapScreen1(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return const SubscriptionScreenView2();
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

  static void onTapCloseButton(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return const SubscriptionDialogWidget();
        });
  }

  static void onDialogTapCloseButton(BuildContext context) {
    Navigator.pop(context);
  }
}
