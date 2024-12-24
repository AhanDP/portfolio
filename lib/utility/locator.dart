import 'package:get_it/get_it.dart';

import 'api_provider.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => ApiProvider());
}
