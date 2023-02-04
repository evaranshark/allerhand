import 'package:allerhand_test/pages/homepage.dart';
import 'package:allerhand_test/pages/map_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/test_page.dart';

class MyRouterDelegate extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final _navigatorKey = GlobalKey<NavigatorState>();
  final _pages = <Page>[];

  MyRouterDelegate() {
    pushPage(name: '/');
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: _onPopPage,
    );
  }

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  Page _createPage(RouteSettings settings, {PageType? type}) {
    Widget child;
    switch (settings.name) {
      case '/':
        child = const HomePage();
        break;
      case '/map':
        child = MapPage();
        break;
      default:
        child = const HomePage();
        break;
    }
    if (type == PageType.material) {
      return MaterialPage(
        name: settings.name,
        arguments: settings.arguments,
        child: child,
      );
    } else {
      return CupertinoPage(
        name: settings.name,
        arguments: settings.arguments,
        child: child,
      );
    }
  }

  void pushPage({required String name, dynamic arguments, PageType? type}) {
    _pages.add(_createPage(RouteSettings(name: name, arguments: arguments),
        type: type));
    notifyListeners();
  }

  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) return false;
    popRoute();
    return true;
  }

  @override
  Future<bool> popRoute() {
    if (_pages.length > 1) {
      _pages.removeLast();
      notifyListeners();
    }
    return Future.value(true);
  }

  @override
  List<Page> get currentConfiguration => List.of(_pages);
}

enum PageType { cupertino, material }
