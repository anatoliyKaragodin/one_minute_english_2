import 'dart:async';

import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/constants.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';

import '../my_parameters.dart';

class MyColorButtonWidget extends ConsumerStatefulWidget {
  final Function func;
  final String text;
  final double? height;
  final double? width;
  final double? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  const MyColorButtonWidget(
      {super.key,
      required this.func,
      required this.text,
      this.height,
      this.padding,
      this.width,
      this.fontSize,
      this.fontWeight});

  @override
  ConsumerState createState() => _MyColorButtonWidget();
}

class _MyColorButtonWidget extends ConsumerState<MyColorButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.padding ?? myParameters.pixelWidth * 20),
      child: InkWell(
        onTap: () {
          widget.func();
        },
        child: Container(
          height: widget.height ?? myParameters.pixelHeight * 54,
          width: widget.width ?? myParameters.pixelWidth * 390,
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
                  fontWeight: widget.fontWeight?? FontWeight.w900,
                  fontSize: widget.fontSize?? myParameters.pixelWidth * 18,
                  color: MyColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
