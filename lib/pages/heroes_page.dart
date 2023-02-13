import 'package:allerhand_test/bloc/heroes_page_bloc.dart';
import 'package:allerhand_test/bloc/interview_page_bloc.dart';
import 'package:allerhand_test/utils/my_router_delegate.dart';
import 'package:allerhand_test/utils/styles.dart';
import 'package:allerhand_test/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/locator.dart';
import '../widgets/custom_dialog.dart';

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
            CustomAppBar(
              height: 120,
              title: 'Все герои',
              onBackPressed: () => _onBackPressed(context),
            ),
            Expanded(child: HeroPageContent()),
          ],
        ),
      ),
    );
  }

  void _onBackPressed(BuildContext context) {
    context.read<HeroesPageBloc>().add(HeroesPageClosedEvent());
  }
}

class HeroPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 145),
        child: Column(
          children: const [
            Section(
              sectionIndex: 0,
            ),
            Section(
              sectionIndex: 1,
            ),
          ],
        ));
  }
}

class Section extends StatelessWidget {
  final int sectionIndex;
  const Section({
    super.key,
    required this.sectionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeroesPageBloc, HeroesPageState>(
        builder: (context, state) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section title
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  state.sections![sectionIndex].title,
                  style: CustomStyles.heroesSectionTitleTextStyle,
                ),
              ),
              //Section people list
              Expanded(
                child: LayoutBuilder(builder: (context, constraints) {
                  return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var item = state.sections![sectionIndex].heroes!
                            .elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<HeroesPageBloc>()
                                .add(HeroesPagePersonSelectedEvent(item.id));
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => _modalBuilder(context),
                            );
                          },
                          child: HeroTile(
                            asset: item.photoRef,
                            name:
                                '${item.familyName} ${item.name} ${item.secondName}',
                            position: item.position,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 20),
                      itemCount: 4);
                }),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _modalBuilder(BuildContext context) {
    return Center(
      child: FittedBox(
        child: BlocBuilder<HeroesPageBloc, HeroesPageState>(
            builder: (context, state) {
          return CustomDialog(
            //width: 1000,
            //height: 700,
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 60),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  state.selectedHeroData!.photoRef,
                  width: 360,
                  height: 360,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 360,
                  child: Text(
                    '${state.selectedHeroData!.familyName} ${state.selectedHeroData!.name} ${state.selectedHeroData!.secondName}',
                    style: CustomStyles.heroPopupNameTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 360,
                  child: Text(
                    state.selectedHeroData!.position,
                    style: CustomStyles.heroPopupPositionTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 360,
                  child: Text(
                    state.selectedHeroData!.description!,
                    style: CustomStyles.heroPopupDescTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                CupertinoButton.filled(
                    child: Text(
                      'Смотреть интервью',
                      style: CustomStyles.heroPopupButtonTextStyle,
                    ),
                    onPressed: () => _onPersonButtonPressed(
                        context, state.selectedPersonId!))
              ],
            ),
          );
        }),
      ),
    );
  }

  _onPersonButtonPressed(BuildContext context, int personId) {
    locator.get<MyRouterDelegate>().pushPage(name: '/interview');
    context.read<InterviewPageBloc>().add(InterviewPageOpenedEvent(personId));
  }
}

class HeroTile extends StatelessWidget {
  final String name, position, asset;
  const HeroTile(
      {super.key,
      required this.name,
      required this.position,
      required this.asset});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // Making person tile 4x3 size with square photo
      var width = constraints.minHeight * .75;
      var height = constraints.maxHeight;
      return SizedBox(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              asset,
              width: width,
              height: width,
              cacheHeight: width.ceil(),
              cacheWidth: width.ceil(),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: CustomStyles.heroTileNameTextStyle,
              textAlign: TextAlign.center,
            ),
            Text(
              position,
              style: CustomStyles.personPositionTextStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    });
  }
}
