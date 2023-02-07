import 'package:allerhand_test/utils/styles.dart';
import 'package:allerhand_test/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HeroesPage extends StatelessWidget {
  const HeroesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(178, 70, 320, 70),
        child: Column(
          children: [
            const CustomAppBar(
              height: 120,
              title: 'Все герои',
            ),
            Expanded(child: HeroPageContent()),
          ],
        ),
      ),
    );
  }
}

class HeroPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 145),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Название секции',
                    style: CustomStyles.heroesSectionTitleTextStyle,
                  ),
                  Expanded(child: Placeholder()),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Название секции',
                    style: CustomStyles.heroesSectionTitleTextStyle,
                  ),
                  Expanded(child: Placeholder()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
