import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minute_english/src/screens/main_menu_settings/model/settings.dart';

class SettingsModel extends StateNotifier<Settings> {
  SettingsModel()
      : super(const Settings(
            listeningOn: true,
            pronunciationOn: true,
            answerSoundOn: true,
            rating: 5)) {
    initState();
  }

  void initState() {}

  void changeTrainingsSettings(int index) {
    if (index == 0) {
      state = state.copyWith(listeningOn: !state.listeningOn);
    } else if (index == 1) {
      state = state.copyWith(pronunciationOn: !state.pronunciationOn);
    } else {
      state = state.copyWith(answerSoundOn: !state.answerSoundOn);
    }
  }

  void setRating(int rating) {
    state = state.copyWith(rating: rating);
  }
}
