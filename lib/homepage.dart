import 'package:allerhand_test/allerhand_icons.dart';
import 'package:allerhand_test/custom_button.dart';
import 'package:allerhand_test/custom_dialog.dart';
import 'package:allerhand_test/onboarding_screens.dart';
import 'package:allerhand_test/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/onboarding.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Row(children: [
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              "assets/main_left.png",
            ),
          ),
        ),
        SizedBox(
          width: 750,
          child: Column(children: [
            const SizedBox(
              height: 95,
            ),
            Image.asset("assets/title_black 1.png"),
            const Spacer(),
            Text("Lorem ipsum.", style: CustomStyles.mainTitleTextStyle),
            Text("Loren ipsum dolor sit amet",
                style: CustomStyles.mainSubitleTextStyle),
            const SizedBox(
              height: 50,
            ),
            Text(
              _getContent(),
              style: CustomStyles.mainContentTextStyle,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            _actionsPanel(context),
            const Spacer(),
          ]),
        ),
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              "assets/main_right.png",
            ),
          ),
        ),
      ]),
    );
  }

  String _getContent() {
    return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eu viverra lectus. Nam sagittis arcu vel felis auctor, ut malesuada lacus hendrerit. Donec ut auctor libero. Donec tincidunt at diam nec pulvinar. Donec posuere hendrerit rhoncus. Vestibulum arcu diam, viverra sit amet sem nec, mollis mollis quam. In sed pellentesque velit.";
  }

  Widget _actionsPanel(BuildContext context) {
    return SizedBox(
      height: 198,
      width: 745,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // кнопка "О нас"
          CustomButton(
            name: 'О нас',
            icon: Allerhand.info,
            onPressed: () => _onInfoPressed(context),
          ),
          ConstrainedBox(
            constraints: BoxConstraints.tight(const Size.fromWidth(50)),
          ),
          // кнопка "Карта"
          CustomButton(
            name: 'Карта',
            width: 276,
            icon: CupertinoIcons.map,
            onPressed: __onMapPressed,
            filled: true,
          ),
          ConstrainedBox(
            constraints: BoxConstraints.tight(const Size.fromWidth(40)),
          ),
          CustomButton(
            name: 'Инструкция',
            icon: Allerhand.questionBubble,
            onPressed: () => _onOnboardingPressed(context),
            padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 36),
          ),
        ],
      ),
    );
  }

  _onInfoPressed(BuildContext context) {}
  _onOnboardingPressed(BuildContext context) {
    showCupertinoModalPopup(context: context, builder: _modalBuilder);
  }

  __onMapPressed() {}

  Widget _modalBuilder(BuildContext context) {
    return Center(
      child: BlocProvider<OnboardingCubit>(
        create: (context) => OnboardingCubit(OnboardingState(0)),
        child: CustomDialog(
          content: OnboardingScreens(
            dismiss: () => Navigator.pop(context),
          ),
          width: 600,
          height: 560,
        ),
      ),
    );
  }
}
