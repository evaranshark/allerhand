import 'package:allerhand_test/utils/allerhand_icons.dart';
import 'package:flutter/widgets.dart';

class AppData {
  AppData._();
  static final stages = ['Цокольный этаж', 'Первый этаж', 'Второй этаж'];

  static final floorData = [
    StageData(asset: 'assets/map_0.png', items: _getFloor0Items()),
    StageData(asset: 'assets/map_1.png', items: _getFloor1Items()),
    StageData(asset: 'assets/map_2.png', items: _getFloor2Items()),
  ];
}

class StageData {
  final String asset;
  final List<LegendItem> items;

  StageData({required this.asset, required this.items});
}

class LegendItem {
  final String? number;
  final List<IconData>? assets;
  final String text;

  LegendItem({this.number, this.assets, required this.text});
}

List<LegendItem> _getFloor1Items() {
  var result = _floor1String.split('\n').map((str) {
    var item = str.split(': ');
    return LegendItem(text: item[1], number: item[0]);
  }).toList();
  return result;
}

List<LegendItem> _getFloor2Items() {
  return _floor2String.split('\n').map((str) {
    var item = str.split(': ');
    return LegendItem(text: item[1], number: item[0]);
  }).toList();
}

List<LegendItem> _getFloor0Items() {
  return <LegendItem>[
    LegendItem(
        text: 'Lorem ipsum dolor sit amet',
        assets: [AllerhandIcons.info_circle]),
    LegendItem(
        text: 'Lorem ipsum dolor sit amet',
        assets: [AllerhandIcons.friends_circle]),
    LegendItem(
        text: 'Lorem ipsum dolor sit amet',
        assets: [AllerhandIcons.radioguide]),
    LegendItem(
        text: 'Lorem ipsum dolor sit amet', assets: [AllerhandIcons.compas]),
    LegendItem(
        text: 'Lorem ipsum dolor sit amet',
        assets: [AllerhandIcons.group_place]),
    LegendItem(
        text: 'Lorem ipsum dolor sit amet',
        assets: [AllerhandIcons.audioguide]),
    LegendItem(
        text: 'Lorem ipsum dolor sit amet', assets: [AllerhandIcons.book]),
    LegendItem(
        text: 'Lorem ipsum dolor sit amet', assets: [AllerhandIcons.cafe]),
    LegendItem(
        text: 'Lorem ipsum dolor sit amet', assets: [AllerhandIcons.wardrobe]),
    LegendItem(
        text: 'Lorem ipsum dolor sit amet', assets: [AllerhandIcons.case_icon]),
    LegendItem(
        text: 'Lorem ipsum dolor sit amet',
        assets: [AllerhandIcons.wc_w, AllerhandIcons.wc_m]),
    LegendItem(
        text: 'Lorem ipsum dolor sit amet', assets: [AllerhandIcons.stairs]),
  ];
}

const _floor1String = """
1: Lorem ipsum dolor sit amet
2: Lorem ipsum dolor sit amet
3: Lorem ipsum dolor sit amet
4: Lorem ipsum dolor sit amet.Lorem ipsum Lorem ipsum dolor sit ametLorem ipsum dolor sit amet
5: Lorem ipsum dolor sit amet
6: Lorem ipsum dolor sit ametLorem ipsum 
7: Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit amet
8: Lorem ipsum dolor sit ametLorem ipsum dolor sit amet
9: Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit amet
10: Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit amet
11: Lorem ipsum dolor sit ametLorem ipsum dolor sit amet
14: Lorem ipsum dolor sit amet
15: Lorem ipsum dolor sit amet
31: Lorem ipsum dolor sit ametLorem ipsum dolor sit amet
D: Lorem ipsum dolor sit amet""";

const _floor2String = """
16: Lorem ipsum dolor sit amet
16a: Lorem ipsum dolor sit amet
17-23, 30: Lorem ipsum dolor sit amet
24: Lorem ipsum dolor sit ametLorem ipsum dolor sit amet
25: Lorem ipsum dolor sit ametLorem ipsum dolor sit amet
26: Lorem ipsum dolor sit ametLorem ipsum dolor sit amet
27: Lorem ipsum dolor sit ametLorem ipsum dolor sit amet
28: Lorem ipsum dolor sit amet
29: Lorem ipsum dolor sit amet""";
