import 'package:one_minute_english/src/screens/subscrubtion_screen/controller/subscrubtion_screen_controller.dart';
import 'package:one_minute_english/src/utils/constants.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_widgets.dart';

import '../../../utils/my_parameters.dart';

class SubscriptionScreenView extends ConsumerStatefulWidget {
  const SubscriptionScreenView({super.key});

  final route = 'subscription page';

  @override
  ConsumerState createState() => _SubscriptionScreenViewState();
}

class _SubscriptionScreenViewState
    extends ConsumerState<SubscriptionScreenView> {
  static const giftImg = 'assets/ui_images/sub/gift.png';
  static const iconImgs = [
    'assets/ui_images/sub/check.png',
    'assets/ui_images/sub/unlock.png',
    'assets/ui_images/sub/notification.png',
    'assets/ui_images/sub/star.png'
  ];
  static final colors = [
    MyColors.orangeColor,
    MyColors.greenColor,
    MyColors.blueColor,
    MyColors.whiteColor
  ];
  static const texts = [
    'Подготовка программы обучения',
    'Сегодня. Полный доступ',
    'День 5. Напоминание',
    'День 7. Начало подписки'
  ];
  static const subTexts = [
    '',
    'Ничего не нужно платить сейчас',
    'Мы напомним об окончании пробного периода. Отмена любой момент',
    'Твоя подписка активируется 27 апреля'
  ];
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTopTextImgContainer(myParameters),
          Padding(
            padding: EdgeInsets.only(left: myParameters.pixelWidth * 20),
            child: SizedBox(
              height: myParameters.pixelHeight * 440,
              width: myParameters.width,
              child: Stack(
                children: [
                  Positioned(
                    left: myParameters.pixelWidth * 26.5,
                    top: 0,
                    bottom: 0,
                    child: CustomPaint(
                      size: Size(myParameters.pixelWidth * 2,
                          myParameters.pixelHeight * 440),
                      painter:
                          DashedLinePainter(color: MyColors.textLiteGreyColor),
                    ),
                  ),
                  buildIconsTextsColumn(myParameters, colors),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: myParameters.pixelHeight * 50),
            child: MyColorButtonWidget(
                func: () =>
                    SubscriptionScreenController.onNextTapScreen1(context),
                text: 'Продолжить'),
          )
        ],
      ),
    );
  }

  SizedBox buildIconsTextsColumn(
      MyParameters myParameters, List<Color?> colors) {
    return SizedBox(
      height: myParameters.pixelHeight * 440,
      width: myParameters.pixelWidth * 313,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            iconImgs.length,
            (index) => SizedBox(
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              right: myParameters.pixelWidth * 8),
                          child: Container(
                            height: myParameters.pixelHeight * 53,
                            width: myParameters.pixelWidth * 53,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colors[index],
                                border: Border.all(
                                    width: index == 3
                                        ? myParameters.pixelWidth
                                        : 0,
                                    color: MyColors.textLiteGreyColor)),
                            child: Padding(
                              padding:
                                  EdgeInsets.all(myParameters.pixelWidth * 14),
                              child: Image.asset(
                                iconImgs[index],
                                fit: BoxFit.contain,
                              ),
                            ),
                          )),
                      Column(
                        children: [
                          SizedBox(
                              width: myParameters.pixelWidth * 240,
                              child: Text(
                                texts[index],
                                style: TextStyle(
                                  fontFamily: MyConstants.fontLabel,
                                  fontWeight: FontWeight.w900,
                                  fontSize: myParameters.pixelWidth * 18,
                                  decoration: index == 0
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  decorationColor: Colors.black,
                                  decorationThickness: 2,
                                ),
                              )),
                          if (index != 0)
                            Padding(
                              padding: EdgeInsets.only(
                                  top: myParameters.pixelHeight * 12),
                              child: SizedBox(
                                width: myParameters.pixelWidth * 240,
                                child: Text(
                                  subTexts[index],
                                  style: TextStyle(
                                      fontFamily: MyConstants.fontLabel,
                                      fontWeight: FontWeight.w400,
                                      fontSize: myParameters.pixelWidth * 12),
                                ),
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                )),
      ),
    );
  }

  Center buildTopTextImgContainer(MyParameters myParameters) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: myParameters.pixelHeight * 115),
        child: Container(
          height: myParameters.pixelHeight * 143,
          width: myParameters.pixelWidth * 341,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(myParameters.pixelWidth * 10),
              border: Border.all(
                  width: myParameters.pixelWidth,
                  color: MyColors.textLiteGreyColor.withOpacity(0.6))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: myParameters.pixelWidth * 200,
                  child: Text(
                    'Учись 7 дней бесплатно',
                    style: TextStyle(
                        fontFamily: MyConstants.fontLabel,
                        fontWeight: FontWeight.w900,
                        fontSize: myParameters.pixelWidth * 25),
                  )),
              Image.asset(
                giftImg,
                height: myParameters.pixelHeight * 92,
                width: myParameters.pixelWidth * 92,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Color color;

  DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final dashWidth = 5;
    final dashSpace = 4;

    double startX = 0;
    while (startX < size.height) {
      canvas.drawLine(
        Offset(0, startX),
        Offset(0, startX + dashWidth),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
