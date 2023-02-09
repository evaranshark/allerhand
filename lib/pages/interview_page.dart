import 'package:allerhand_test/utils/locator.dart';
import 'package:allerhand_test/utils/my_router_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/custom_app_bar.dart';

class InterviewPage extends StatelessWidget {
  const InterviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(178, 70, 320, 70),
        child: Column(
          children: [
            CustomAppBar(
              height: 120,
              title: 'Фамилия Имя Отчество',
              onBackPressed: _onBackPressed,
            ),
            Expanded(child: Placeholder()),
          ],
        ),
      ),
    );
  }

  _onBackPressed() {}
}
