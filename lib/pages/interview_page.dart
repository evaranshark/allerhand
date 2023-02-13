import 'package:allerhand_test/bloc/interview_page_bloc.dart';
import 'package:allerhand_test/utils/locator.dart';
import 'package:allerhand_test/utils/my_router_delegate.dart';
import 'package:allerhand_test/utils/styles.dart';
import 'package:allerhand_test/widgets/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_app_bar.dart';

class InterviewPage extends StatelessWidget {
  const InterviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      //resizeToAvoidBottomInset: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(178, 70, 320, 60),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            BlocBuilder<InterviewPageBloc, InterviewPageState>(
                builder: (context, state) {
              return CustomAppBar(
                height: 120,
                title: state.pageTitle ?? 'Some',
                onBackPressed: _onBackPressed,
              );
            }),
            Expanded(child: InterviewPageContent()),
          ],
        ),
      ),
    );
  }

  _onBackPressed() {}
}

class InterviewPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 160),
      child: LayoutBuilder(builder: (context, constraints) {
        return Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: constraints.maxWidth * .67,
            height: constraints.maxHeight,
            child: BlocBuilder<InterviewPageBloc, InterviewPageState>(
                builder: (context, state) {
              return ListView(
                //mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    state.subtitle ?? 'Some',
                    style: CustomStyles.interviewSubtitleTextStyle,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 36),
                      child: VideoPlayerScreen(
                          asset: state.videoRef ?? 'assets/24216.mp4'),
                    ),
                  ),
                  Placeholder(
                    fallbackHeight: 205,
                  )
                ],
              );
            }),
          ),
        );
      }),
    );
  }
}
