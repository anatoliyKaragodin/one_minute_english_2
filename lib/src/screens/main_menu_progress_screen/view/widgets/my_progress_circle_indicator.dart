import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';

import '../../../../utils/app_language/app_language.dart';
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
    return Stack(
      children: [
        SizedBox(
          height: myParameters.pixelWidth * 167,
          width: myParameters.pixelWidth * 167,
          child: CircularProgressIndicator(
            value: 1,
            color: MyColors.mainColor,
          ),
        ),
        SizedBox(
          height: myParameters.pixelWidth * 167,
          width: myParameters.pixelWidth * 167,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(myParameters.pixelWidth*5),

            child: CircularProgressIndicator(
              value: value,
              color: MyColors.greenColor,
            ),
          ),
        )
      ],
    );
  }
}
