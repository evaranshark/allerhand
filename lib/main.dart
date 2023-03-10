import 'package:allerhand_test/bloc/heroes_page_bloc.dart';
import 'package:allerhand_test/bloc/interview_page_bloc.dart';
import 'package:allerhand_test/bloc/mappage_bloc.dart';
import 'package:allerhand_test/bloc/people_bloc.dart';
import 'package:allerhand_test/pages/heroes_page.dart';
import 'package:allerhand_test/pages/pages.dart';
import 'package:allerhand_test/utils/app_scroll_behavior.dart';
import 'package:allerhand_test/utils/locator.dart';
import 'package:allerhand_test/utils/my_router_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setup();
  runApp(const AllerhandTestApp());
}

class AllerhandTestApp extends StatelessWidget {
  const AllerhandTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<FloorCubit>(create: ((context) => FloorCubit())),
        BlocProvider<MapPeopleCubit>(create: (context) => MapPeopleCubit()),
        BlocProvider<HeroesPageBloc>(create: (context) => HeroesPageBloc()),
        BlocProvider<InterviewPageBloc>(
            create: (context) => InterviewPageBloc()),
      ],
      child: CupertinoApp.router(
        title: "Allerhand",
        theme: const CupertinoThemeData(
          primaryColor: Color.fromARGB(255, 46, 64, 131),
          brightness: Brightness.light,
        ),
        routerDelegate: locator.get<MyRouterDelegate>(),
        scrollBehavior: AppScrollBehavior(),
      ),
    );
  }
}
