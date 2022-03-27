import 'package:flutter_github_app/services/network_service.dart';
import 'package:flutter_github_app/services/search_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => NetworkService());
  locator.registerLazySingleton(() => SearchService());
}
