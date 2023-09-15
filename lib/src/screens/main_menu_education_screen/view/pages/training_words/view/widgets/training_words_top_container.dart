import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class TrainingWordsTopContainer extends StatelessWidget {
  final String text;
  final double progress;
  const TrainingWordsTopContainer(
      {super.key, required this.text, required this.progress});

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);

    return Padding(
      padding: EdgeInsets.only(top: myParameters.pixelHeight * 70),
      child: Column(
        children: [
          buildTopRow(),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: myParameters.pixelWidth * 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: myParameters.pixelWidth * 8,
                  child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(myParameters.pixelWidth * 8),
                      child: LinearProgressIndicator(
                        value: progress,
                        color: MyColors.mainColor,
                        backgroundColor: MyColors.greyColorLite,
                      )),
                ),
                AnimatedPositioned(
                  left: myParameters.pixelWidth*(360*progress-20),
                  top: myParameters.pixelHeight*-30,
                    duration: const Duration(milliseconds: 200),
                    child: Image.asset(
                      'assets/ui_images/main_app/icons/rocket.png',
                      width: myParameters.pixelWidth * 65,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Row buildTopRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close_rounded,
              color: MyColors.greyColor!,
            )),
        Padding(
          padding: const EdgeInsets.only(right: 47),
          child: MyTextWidget(
            text: text.toUpperCase(),
            fontSize: 14,
          ),
        ),
        const SizedBox.shrink()
      ],
    );
  }
}
