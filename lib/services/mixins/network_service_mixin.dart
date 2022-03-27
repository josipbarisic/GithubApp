import 'package:flutter_github_app/app/locator.dart';
import 'package:flutter_github_app/services/network_service.dart';

mixin NetworkServiceMixin {
  NetworkService networkService = locator<NetworkService>();
}
