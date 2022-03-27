import 'package:flutter_github_app/globals/network_constants.dart';
import 'package:flutter_github_app/services/mixins/network_service_mixin.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel with NetworkServiceMixin {
  void fetchRepositories(String queryString) {
    networkService.getHttp(
      url: API_SEARCH_REPOS,
      queryParams: <String, dynamic>{'q': queryString},
    );
  }
}
