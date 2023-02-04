import 'package:allerhand_test/bloc/onboarding.dart';
import 'package:allerhand_test/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/ah_tabpageselector.dart';

class OnboardingScreens extends StatefulWidget {
  final VoidCallback dismiss;

  const OnboardingScreens({super.key, required this.dismiss});
  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        Widget? child;
        switch (state.index) {
          case 0:
            child = OnboardingScreen(
              content: 'Текст с описанием инструкции 1',
              title: 'Заголовок 1',
              buttonName: 'Далее',
              callback: () => context.read<OnboardingCubit>().setIndex(1),
            );
            break;
          case 1:
            child = OnboardingScreen(
              content: 'Текст с описанием инструкции 2',
              title: 'Заголовок 2',
              buttonName: 'Далее',
              callback: () => context.read<OnboardingCubit>().setIndex(2),
            );
            break;
          case 2:
            child = OnboardingScreen(
              content: 'Текст с описанием инструкции 3',
              title: 'Заголовок 3',
              buttonName: 'Завершить',
              callback: () {
                context.read<OnboardingCubit>().resetIndex();
                widget.dismiss.call();
              },
            );
            break;
        }
        return child ?? const SizedBox();
      },
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final String title, content, buttonName;
  final VoidCallback callback;

  const OnboardingScreen({
    super.key,
    required this.title,
    required this.content,
    required this.buttonName,
    required this.callback,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          // Title zone
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                title,
                style: CustomStyles.dialogTitleTextStyle,
              ),
              Baseline(
                baseline: 47,
                baselineType: TextBaseline.alphabetic,
                child: CustomTabPageSelector(
                  length: 3,
                  selectedIndex: context.read<OnboardingCubit>().state.index,
                  indicatorSize: 20,
                  borderStyle: BorderStyle.solid,
                  borderWidth: 2.0,
                  color: CupertinoDynamicColor.resolve(
                      const CupertinoDynamicColor.withBrightness(
                        color: Color(0xCCF2F2F2),
                        darkColor: Color(0xBF1E1E1E),
                      ),
                      context),
                  selectedColor: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          // Content zone
          Text(
            content,
            style: CustomStyles.dialogContentTextStyle,
          ),
          const Spacer(),
          // Action zone
          CupertinoButton.filled(
            onPressed: _onPressed,
            child: Text(
              buttonName,
              style: CustomStyles.buttonTextStyle,
            ),
          ),
        ],
      );
  }

  void _onPressed() {
    callback.call();
  }
}
