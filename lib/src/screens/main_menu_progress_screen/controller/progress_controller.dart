import 'package:one_minute_english/src/screens/main_menu_progress_screen/model/progress.dart';
import 'package:one_minute_english/src/screens/main_menu_progress_screen/model/progress_model.dart';
import 'package:one_minute_english/src/utils/library.dart';

final progressProvider = StateNotifierProvider<ProgressModel, Progress>((ref) {
  return ProgressModel();
});


class ProgressController {
  static void onTapDate(WidgetRef ref, int index) {
    ref.read(progressProvider.notifier).setDate(index);
  }

  static void onTapMoveMonth(WidgetRef ref, bool isForward) {
    ref.read(progressProvider.notifier).changeMonth(isForward);
  }
}