import 'package:one_minute_english/main.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';

import '../../../../utils/app_language/app_language.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/my_parameters.dart';

class MyProgressCircleIndicator extends StatelessWidget {
  final int langIndex;
  final double value;
  const MyProgressCircleIndicator(
      {super.key, required this.langIndex, required this.value});

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final lang = AppLanguage.listOfLanguages[langIndex];
    return SizedBox(
      height: myParameters.pixelHeight * 205,
      width: myParameters.pixelWidth * 168,
      child: Stack(alignment: Alignment.center, children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            '24 января',
            style: TextStyle(
                color: isDarkTheme
                    ? MyColors.whiteColor
                    : MyColors.textLiteGreyColor,
                fontWeight: FontWeight.w700,
                fontFamily: MyConstants.fontLabel,
                fontSize: myParameters.pixelWidth * 20),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Transform.rotate(
            angle: 0.6,
            child: CircularPercentIndicator(
                circularStrokeCap: CircularStrokeCap.round,
                lineWidth: myParameters.pixelWidth * 25,
                percent: value,
                backgroundColor: MyColors.mainColor,
                progressColor: MyColors.greenColor,
                radius: myParameters.pixelWidth * 84),
          ),
        ),
        Positioned(
          bottom: myParameters.pixelHeight * 50,
          // left: myParameters.pixelWidth*84,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '4',
                style: TextStyle(
                    color: isDarkTheme
                        ? MyColors.whiteColor
                        : MyColors.textLiteGreyColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: MyConstants.fontLabel,
                    fontSize: myParameters.pixelWidth * 45),
              ),
              Text(
                lang[LangKey.words]!,
                style: TextStyle(
                    color: isDarkTheme
                        ? MyColors.whiteColor
                        : MyColors.textMoreLiteGreyColor,
                    fontWeight: FontWeight.w800,
                    fontFamily: MyConstants.fontLabel,
                    fontSize: myParameters.pixelWidth * 18),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
