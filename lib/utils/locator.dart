import 'package:allerhand_test/utils/my_router_delegate.dart';
import 'package:allerhand_test/utils/repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<MyRouterDelegate>(MyRouterDelegate());
  locator.registerSingleton<AllerhandRepository>(const AllerhandRepository());
}
