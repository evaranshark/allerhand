import 'package:allerhand_test/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  Page _createPage(RouteSettings settings) {
    Widget child;
    switch (settings.name) {
      case '/':
        child = const HomePage();
        break;
      default:
        child = const HomePage();
        break;
    }
    return CupertinoPage(
      name: settings.name,
      arguments: settings.arguments,
      child: child,
    );
  }

  void pushPage({required String name, dynamic arguments}) {
    _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
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
