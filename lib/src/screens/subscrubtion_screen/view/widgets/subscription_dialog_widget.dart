import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_widgets.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/my_colors.dart';
import '../../../../utils/my_parameters.dart';
import '../../controller/subscrubtion_screen_controller.dart';

class SubscriptionDialogWidget extends ConsumerStatefulWidget {
  const SubscriptionDialogWidget({super.key});

  @override
  ConsumerState createState() => _SubscriptionDialogWidgetState();
}

class _SubscriptionDialogWidgetState
    extends ConsumerState<SubscriptionDialogWidget> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final textsPart1 = ['Это ', 'Есть '];
    final textsPart2 = ['абсолютно бесплатно ', 'возможность отменить '];
    final textsPart3 = ['в течение пробного периода.', 'в любой момент.'];

    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(myParameters.pixelWidth * 10)),
      child: SizedBox(
        height: myParameters.pixelHeight * 334,
        width: myParameters.pixelWidth * 306,
        child: Column(
          children: [
            buildCloseButton(myParameters, context),
            buildTopText(myParameters),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: myParameters.pixelHeight * 32,
                  horizontal: myParameters.pixelWidth * 25),
              child: SizedBox(
                height: myParameters.pixelHeight * 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      2,
                      (index) => Row(
                            children: [
                              Icon(
                                Icons.check_rounded,
                                color: MyColors.greenDarkColor,
                                size: myParameters.pixelWidth * 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: myParameters.pixelWidth * 5),
                                child: SizedBox(
                                  width: myParameters.pixelWidth * 220,
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontFamily: MyConstants.fontLabel,
                                          fontSize:
                                              myParameters.pixelWidth * 14,
                                          color: MyColors.textLiteGreyColor),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: textsPart1[index],
                                        ),
                                        TextSpan(
                                            text: textsPart2[index],
                                            style: TextStyle(
                                                color:
                                                    MyColors.greenDarkColor)),
                                        TextSpan(
                                          text: textsPart3[index],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                ),
              ),
            ),
            buildBottomButton(myParameters)
          ],
        ),
      ),
    );
  }

  Padding buildBottomButton(MyParameters myParameters) {
    return Padding(
      padding: EdgeInsets.only(
          left: myParameters.pixelWidth * 18,
          right: myParameters.pixelWidth * 18,
          top: myParameters.pixelHeight * 20),
      child: MyColorButtonWidget(func: () => null, text: 'Использовать 7 дней'),
    );
  }

  Text buildTopText(MyParameters myParameters) {
    return Text(
      'Не беспокойся',
      style: TextStyle(
          fontFamily: MyConstants.fontLabel,
          fontWeight: FontWeight.w900,
          fontSize: myParameters.pixelWidth * 16),
    );
  }

  Row buildCloseButton(MyParameters myParameters, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: myParameters.pixelHeight * 12,
              right: myParameters.pixelWidth * 15),
          child: Container(
            height: myParameters.pixelHeight * 30,
            width: myParameters.pixelWidth * 30,
            decoration: BoxDecoration(
                color: MyColors.textLiteGreyColor.withOpacity(0.05),
                shape: BoxShape.circle),
            child: Center(
              child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    SubscriptionScreenController.onDialogTapCloseButton(
                        context);
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    color: MyColors.textLiteGreyColor,
                    size: myParameters.pixelWidth * 22,
                  )),
            ),
          ),
        )
      ],
    );
  }
}
