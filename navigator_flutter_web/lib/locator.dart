import 'package:get_it/get_it.dart';
import 'package:navigator_flutter_web/services/api.dart';
import 'package:navigator_flutter_web/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Api());
}
