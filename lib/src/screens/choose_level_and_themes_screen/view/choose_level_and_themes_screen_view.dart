import 'package:one_minute_english/src/screens/choose_level_and_themes_screen/controller/choose_level_and_themes_controller.dart';
import 'package:one_minute_english/src/screens/choose_level_and_themes_screen/view/widgtes/list_of_themes_widget.dart';
import 'package:one_minute_english/src/utils/library.dart';

import '../../../utils/constants.dart';
import '../../../utils/my_parameters.dart';
import '../../../utils/my_widgets.dart';

class ChooseLvlAndThemesScreenView extends ConsumerStatefulWidget {
  const ChooseLvlAndThemesScreenView({super.key});

  final route = 'choose lvl and themes page';

  @override
  ConsumerState createState() => _ChooseLvlAndThemesScreenViewState();
}

class _ChooseLvlAndThemesScreenViewState
    extends ConsumerState<ChooseLvlAndThemesScreenView> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: myParameters.pixelHeight * 104,
                  bottom: myParameters.pixelHeight * 10),
              child: SizedBox(
                width: myParameters.pixelWidth * 229,
                child: Text(
                  'Выбери темы, которые хочешь изучать',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: MyConstants.fontLabel,
                      fontSize: myParameters.pixelWidth * 18,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
          const ListOfThemesWidget(),
          Padding(
            padding: EdgeInsets.only(top: myParameters.pixelHeight * 20),
            child: MyColorButtonWidget(
              func: () =>
                  ChooseLevelAndThemesController.onNextTap(context, ref),
              text: 'Далее',
            ),
          )
        ],
      ),
    );
  }
}
