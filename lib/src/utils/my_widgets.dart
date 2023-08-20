import 'dart:async';

import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/constants.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';

import 'my_parameters.dart';

class MyColorButtonWidget extends ConsumerStatefulWidget {
  final Function func;
  final String text;
  const MyColorButtonWidget(
      {super.key, required this.func, required this.text});

  @override
  ConsumerState createState() => _MyColorButtonWidget();
}

class _MyColorButtonWidget extends ConsumerState<MyColorButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: myParameters.pixelWidth * 20),
      child: InkWell(
        onTap: () {
          widget.func();
        },
        child: Container(
          height: myParameters.pixelHeight * 54,
          width: myParameters.pixelWidth * 390,
          decoration: BoxDecoration(
              color: MyColors.mainColor,
              boxShadow: [
                BoxShadow(
                  color: MyColors.mainColorShadow,
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: const Offset(0, 5),
                ),
              ],
              borderRadius:
                  BorderRadius.circular(myParameters.pixelHeight * 10)),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                  fontFamily: MyConstants.fontLabel,
                  fontWeight: FontWeight.w400,
                  fontSize: myParameters.pixelWidth * 18,
                  color: MyColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
