import 'package:allerhand_test/app_data.dart';
import 'package:allerhand_test/bloc/mappage_bloc.dart';
import 'package:allerhand_test/bloc/people_bloc.dart';
import 'package:allerhand_test/utils/allerhand_icons.dart';
import 'package:allerhand_test/utils/my_router_delegate.dart';
import 'package:allerhand_test/utils/styles.dart';
import 'package:allerhand_test/widgets/ah_tabpageselector.dart';
import 'package:allerhand_test/widgets/custom_app_bar.dart';
import 'package:allerhand_test/widgets/custom_button.dart';
import 'package:allerhand_test/widgets/custom_dialog.dart';
import 'package:allerhand_test/widgets/page_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/person.dart';
import '../utils/locator.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    context.read<FloorCubit>().update(floorName: AppData.stages[1], index: 1);
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(178, 70, 75, 70),
        child: Column(
          children: [
            MapPageAppBar(),
            MapPageContent(),
          ],
        ),
      ),
    );
  }
}

class MapTab extends StatelessWidget {
  const MapTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MapPageAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FloorCubit, FloorState>(
      builder: (context, state) => CustomAppBar(
        title: 'Карта',
        subtitle: state.floorName!,
        trailing: CustomButton(
          width: 166,
          height: 120,
          icon: AllerhandIcons.group,
          padding: const EdgeInsets.symmetric(horizontal: 52),
          iconSize: 62,
          name: 'Все герои',
          namePadding: const EdgeInsets.only(top: 10),
          onPressed: _onGroupPressed,
        ),
      ),
    );
  }

  void _onGroupPressed() {}
}

class MapPageContent extends StatelessWidget {
  MapPageContent({super.key});
  final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 47, 0, 0),
        child: PageView.builder(
          onPageChanged: (value) => context
              .read<FloorCubit>()
              .update(floorName: AppData.stages[value], index: value),
          scrollDirection: Axis.horizontal,
          controller: controller,
          itemCount: 3,
          itemBuilder: (context, index) {
            // Map and it's legend
            return Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Map
                  Flexible(
                    flex: 3,
                    child: _buildMap(index),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  // Legend
                  Flexible(
                    flex: 4,
                    child: _buildLegend(index),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLegend(int index) {
    return ListView.builder(
      itemCount: AppData.floorData[index].items.length,
      itemBuilder: (context, itemIndex) {
        var item = AppData.floorData[index].items[itemIndex];
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item.number != null)
                SizedBox(
                  width: 150,
                  child: Text(
                    item.number!,
                    style: CustomStyles.mapContentTextStyle,
                    textAlign: TextAlign.end,
                  ),
                ),
              if (item.assets != null) _buildIcons(item.assets!),
              const SizedBox(
                width: 50,
              ),
              Flexible(
                child: Text(
                  item.text,
                  style: CustomStyles.mapContentTextStyle,
                  softWrap: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMap(int index) {
    return Builder(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: GestureDetector(
              onTap: () {
                context.read<PeopleCubit>().selectStage(index);
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) => _modalBuilder(
                        context,
                        index,
                        Text(
                          '4',
                          style: CustomStyles.iconTextStyle,
                        )));
              },
              child: Image.asset(
                AppData.floorData[index].asset,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: CustomTabPageSelector(
              indicatorSize: 26,
              borderWidth: 3,
              length: 3,
              selectedIndex: index,
            ),
          ),
        ],
      );
    });
  }

  _buildIcons(List<IconData> assets) {
    return SizedBox(
      width: 150,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: assets
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: DecoratedBox(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        e,
                        size: 40,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _modalBuilder(BuildContext context, int index, Widget icon) {
    return Center(
      child: CustomDialog(
        width: 1000,
        height: 700,
        padding: EdgeInsets.symmetric(horizontal: 90, vertical: 70),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _modalTitle(icon),
            Expanded(child: _modalPeople()),
          ],
        ),
      ),
    );
  }

  Widget _modalTitle(Widget icon) {
    return Builder(builder: (context) {
      return Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromARGB(255, 46, 64, 131), width: 2.0),
            ),
            child: SizedBox(
              width: 65,
              height: 65,
              child: Center(child: icon),
            ),
          ),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              context.read<PeopleCubit>().state.title!,
              style: CustomStyles.mapModalTitleTextStyle,
            ),
          )),
        ],
      );
    });
  }

  Widget _modalPeople() {
    return Builder(builder: (context) {
      var people = context.read<PeopleCubit>().state.people;
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: ListView.builder(
              itemCount: people!.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) => _getPersonCard(
                  person: people[index], buttonName: 'Выбрать'))),
        ),
      );
    });
  }

  Widget? _getPersonCard({Person? person, required buttonName, onPressed}) {
    return (person != null)
        ? Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      person.photoRef,
                      width: 250,
                      height: 250,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
                    child: Text(
                      '${person.familyName} ${person.name} ${person.secondName}',
                      style: CustomStyles.personModalNameTextStyle,
                    ),
                  ),
                  Text(
                    person.position,
                    style: CustomStyles.personPositionTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CupertinoButton.filled(
                      onPressed: () {},
                      child: Text(
                        buttonName,
                        style: CustomStyles.personButtonTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
