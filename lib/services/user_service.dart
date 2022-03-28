import 'package:dio/dio.dart';
import 'package:flutter_github_app/models/repository.dart';
import 'package:flutter_github_app/models/user.dart';
import 'package:flutter_github_app/models/user_profile_data.dart';
import 'package:flutter_github_app/services/base_service.dart';
import 'package:flutter_github_app/services/mixins/network_service_mixin.dart';
import 'package:stacked/stacked.dart';

class UserService extends BaseService<UserProfileData>
    with ReactiveServiceMixin, NetworkServiceMixin {
  UserService() {
    initRxModel(
      UserProfileData(user: User.fromJson({}), userRepos: []),
    );
    listenToReactiveValues([
      super.getRxModel(),
    ]);
  }

  void setUser(User user) =>
      setRxModelValue(UserProfileData(user: user, userRepos: []));

  Future<void> fetchUserData({required String userDataUrl}) async {
    Response? response = await networkService.getHttp(
      url: userDataUrl,
    );
    if (response != null) {
      setRxModelValue(
        getRxModelValue().cloneWithMutation({
          'user': User.fromJson(response.data),
        }),
      );
    }
  }

  Future<void> fetchUserRepos({required String userReposUrl}) async {
    Response? response = await networkService.getHttp(url: userReposUrl);
    if (response != null) {
      final List<dynamic> jsonList = response.data as List<dynamic>;
      setRxModelValue(
        getRxModelValue().cloneWithMutation({
          'user_repos': jsonList.map((e) => Repository.fromJson(e)).toList(),
        }),
      );
    }
  }
}
