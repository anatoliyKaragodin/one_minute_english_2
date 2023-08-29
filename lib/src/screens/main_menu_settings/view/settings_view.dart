import 'package:one_minute_english/src/screens/main_menu_settings/controller/settings_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_settings/model/settings.dart';
import 'package:one_minute_english/src/screens/main_menu_settings/view/widgets/my_rating_widget.dart';
import 'package:one_minute_english/src/screens/main_menu_settings/view/widgets/my_switch.dart';
import 'package:one_minute_english/src/utils/library.dart';

import '../../../../main.dart';
import '../../../utils/app_language/app_language.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_parameters.dart';
import '../../../utils/my_widgets/my_color_button.dart';
import '../../start_screen/controller/start_screen_controller.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    final settings = ref.watch(settingsProvider);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: myParameters.pixelWidth * 20,
            vertical: myParameters.pixelHeight * 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBigText(
                myParameters, lang[LangKey.settings]!, MyColors.whiteColor),
            buildGet7DaysAccessContainer(myParameters, lang),
            buildBigText(
                myParameters, lang[LangKey.education]!, MyColors.greyColor),
            buildEducationContainer(myParameters, lang),
            buildBigText(
                myParameters, lang[LangKey.trainings]!, MyColors.greyColor),
            buildTrainingsContainer(myParameters, lang, settings),
            buildBigText(
                myParameters, lang[LangKey.feedback]!, MyColors.greyColor),
            buildFeedbackContainer(myParameters, lang, settings.rating),
            buildBigText(
                myParameters, lang[LangKey.other]!, MyColors.greyColor),
            buildOtherContainer(myParameters, lang),
          ],
        ),
      ),
    );
  }

  Container buildGet7DaysAccessContainer(
      MyParameters myParameters, Map<LangKey, String> lang) {
    return Container(
      height: myParameters.pixelHeight * 141,
      width: myParameters.pixelWidth * 390,
      decoration: BoxDecoration(
          color: isDarkTheme ? MyColors.blackColor87 : MyColors.whiteColor,
          borderRadius: BorderRadius.circular(myParameters.pixelWidth * 10),
          boxShadow: [
            BoxShadow(
                color: MyColors.textLiteGreyColor.withOpacity(0.6),
                blurRadius: myParameters.pixelWidth * 6)
          ]),
      child: Stack(
        children: [
          buildTextsAndButtonColumn(myParameters, lang),
          buildImage(myParameters)
        ],
      ),
    );
  }

  Container buildEducationContainer(
      MyParameters myParameters, Map<LangKey, String> lang) {
    return Container(
        height: myParameters.pixelHeight * 146,
        width: myParameters.pixelWidth * 390,
        decoration: BoxDecoration(
            color:
                isDarkTheme ? MyColors.backColorDarkTheme : MyColors.whiteColor,
            borderRadius: BorderRadius.circular(myParameters.pixelWidth * 10),
            boxShadow: [
              BoxShadow(
                  color: MyColors.textLiteGreyColor
                      .withOpacity(isDarkTheme ? 0 : 0.6),
                  blurRadius: myParameters.pixelWidth * 6)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: myParameters.pixelHeight * 63,
                child: buildNormalText(
                    myParameters, lang[LangKey.themesForLearning]!, 16)),
            const Divider(),
            SizedBox(
                height: myParameters.pixelHeight * 63,
                child: Column(
                  children: [
                    buildNormalText(
                        myParameters, lang[LangKey.wordsPerDay]!, 16),
                    SizedBox(
                      height: myParameters.pixelHeight * 11,
                    ),
                    buildNormalText(
                        myParameters, '8 ${lang[LangKey.words]!}', 12),
                  ],
                )),
          ],
        ));
  }

  Container buildFeedbackContainer(
      MyParameters myParameters, Map<LangKey, String> lang, int rating) {
    return Container(
        height: myParameters.pixelHeight * 132,
        width: myParameters.pixelWidth * 390,
        decoration: BoxDecoration(
            color:
                isDarkTheme ? MyColors.backColorDarkTheme : MyColors.whiteColor,
            borderRadius: BorderRadius.circular(myParameters.pixelWidth * 10),
            boxShadow: [
              BoxShadow(
                  color: MyColors.textLiteGreyColor.withOpacity(0.6),
                  blurRadius: myParameters.pixelWidth * 6)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: myParameters.pixelHeight * 56.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildNormalText(
                        myParameters, lang[LangKey.rateTheApp]!, 16),
                    Padding(
                      padding:
                          EdgeInsets.only(right: myParameters.pixelWidth * 12),
                      child: MyRatingWidget(
                        rating: rating,
                      ),
                    )
                  ],
                )),
            const Divider(),
            SizedBox(
                height: myParameters.pixelHeight * 56.5,
                child: buildNormalText(
                    myParameters, lang[LangKey.answerSound]!, 16)),
          ],
        ));
  }

  Container buildTrainingsContainer(
      MyParameters myParameters, Map<LangKey, String> lang, Settings settings) {
    return Container(
        height: myParameters.pixelHeight * 219,
        width: myParameters.pixelWidth * 390,
        decoration: BoxDecoration(
            color:
                isDarkTheme ? MyColors.backColorDarkTheme : MyColors.whiteColor,
            borderRadius: BorderRadius.circular(myParameters.pixelWidth * 10),
            boxShadow: [
              BoxShadow(
                  color: MyColors.textLiteGreyColor
                      .withOpacity(isDarkTheme ? 0 : 0.6),
                  blurRadius: myParameters.pixelWidth * 6)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTrainingsRow(
                myParameters,
                lang[LangKey.listening]!,
                () => SettingsController.onTrainingsSwitchTap(ref, 0),
                settings.listeningOn),
            const Divider(),
            buildTrainingsRow(
                myParameters,
                lang[LangKey.pronunciation]!,
                () => SettingsController.onTrainingsSwitchTap(ref, 1),
                settings.pronunciationOn),
            const Divider(),
            buildTrainingsRow(
                myParameters,
                lang[LangKey.answerSound]!,
                () => SettingsController.onTrainingsSwitchTap(ref, 2),
                settings.answerSoundOn),
          ],
        ));
  }

  Container buildOtherContainer(
      MyParameters myParameters, Map<LangKey, String> lang) {
    return Container(
        height: myParameters.pixelHeight * 219,
        width: myParameters.pixelWidth * 390,
        decoration: BoxDecoration(
            color:
                isDarkTheme ? MyColors.backColorDarkTheme : MyColors.whiteColor,
            borderRadius: BorderRadius.circular(myParameters.pixelWidth * 10),
            boxShadow: [
              BoxShadow(
                  color: MyColors.textLiteGreyColor
                      .withOpacity(isDarkTheme ? 0 : 0.6),
                  blurRadius: myParameters.pixelWidth * 6)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: myParameters.pixelHeight * 60,
                child: buildNormalText(
                    myParameters, lang[LangKey.notifications]!, 16)),
            const Divider(),
            SizedBox(
                height: myParameters.pixelHeight * 60,
                child: buildNormalText(
                    myParameters, lang[LangKey.termsOfUse]!, 16)),
            const Divider(),
            SizedBox(
                height: myParameters.pixelHeight * 60,
                child: buildNormalText(
                    myParameters, lang[LangKey.privacyPolicy]!, 16)),
          ],
        ));
  }

  SizedBox buildTrainingsRow(MyParameters myParameters, String text,
      Function onTrainingsSwitchTap, bool isOn) {
    return SizedBox(
        height: myParameters.pixelHeight * 60.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildNormalText(myParameters, text, 16),
            Padding(
              padding: EdgeInsets.only(right: myParameters.pixelWidth * 20),
              child: MySwitch(isOn: isOn, onTap: onTrainingsSwitchTap),
            )
          ],
        ));
  }

  Padding buildNormalText(
      MyParameters myParameters, String text, int fontSize) {
    return Padding(
      padding: EdgeInsets.only(left: myParameters.pixelWidth * 17),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
              color: isDarkTheme ? MyColors.whiteColor : MyColors.blackColor87,
              fontFamily: MyConstants.fontLabel,
              fontWeight: FontWeight.w400,
              fontSize: myParameters.pixelWidth * fontSize),
        ),
      ),
    );
  }

  Padding buildBigText(
      MyParameters myParameters, String text, Color? darkColor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: myParameters.pixelHeight * 45),
      child: Text(
        text,
        style: TextStyle(
            color: isDarkTheme ? darkColor : MyColors.blackColor87,
            fontFamily: MyConstants.fontLabel,
            fontWeight: FontWeight.w900,
            fontSize: myParameters.pixelWidth * 22),
      ),
    );
  }

  Positioned buildImage(MyParameters myParameters) {
    return Positioned(
        bottom: myParameters.pixelHeight * 16,
        right: myParameters.pixelWidth * 31,
        child: Image.asset(
          'assets/ui_images/main_app/settings/unlock_easy_access_img.png',
          height: myParameters.pixelHeight * 110,
          width: myParameters.pixelWidth * 110,
        ));
  }

  Padding buildTextsAndButtonColumn(
      MyParameters myParameters, Map<LangKey, String> lang) {
    return Padding(
      padding: EdgeInsets.only(
          left: myParameters.pixelWidth * 20,
          top: myParameters.pixelHeight * 11,
          bottom: myParameters.pixelHeight * 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lang[LangKey.get7moreDays]!,
            style: TextStyle(
                color:
                    isDarkTheme ? MyColors.whiteColor : MyColors.blackColor87,
                fontFamily: MyConstants.fontLabel,
                fontSize: myParameters.pixelWidth * 18,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            width: myParameters.pixelWidth * 162,
            child: Text(
              lang[LangKey.lastDayOfAccess]!,
              style: TextStyle(
                  color: MyColors.textLiteGreyColor,
                  fontFamily: MyConstants.fontLabel,
                  fontSize: myParameters.pixelWidth * 12),
            ),
          ),
          MyColorButtonWidget(
            color: MyColors.mainColor,
            func: () => null,
            text: lang[LangKey.get]!,
            padding: 0,
            width: myParameters.pixelWidth * 184,
            height: myParameters.pixelHeight * 48.5,
          )
        ],
      ),
    );
  }
}
