import 'package:allerhand_test/bloc/heroes_page_bloc.dart';
import 'package:allerhand_test/utils/styles.dart';
import 'package:allerhand_test/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      padding: EdgeInsets.only(left: 145),
      child: BlocBuilder<HeroesPageBloc, HeroesPageState>(
          builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        state.sections![0].title,
                        style: CustomStyles.heroesSectionTitleTextStyle,
                      ),
                    ),
                    Expanded(
                      child: LayoutBuilder(builder: (context, constraints) {
                        return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var item =
                                  state.sections![0].heroes!.elementAt(index);
                              return HeroTile(
                                asset: item.photoRef,
                                name:
                                    '${item.familyName} ${item.name} ${item.secondName}',
                                position: item.position,
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
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        state.sections![1].title,
                        style: CustomStyles.heroesSectionTitleTextStyle,
                      ),
                    ),
                    Expanded(
                      child: LayoutBuilder(builder: (context, constraints) {
                        return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var item =
                                  state.sections![1].heroes!.elementAt(index);
                              return HeroTile(
                                asset: item.photoRef,
                                name:
                                    '${item.familyName} ${item.name} ${item.secondName}',
                                position: item.position,
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
            ),
          ],
        );
      }),
    );
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
