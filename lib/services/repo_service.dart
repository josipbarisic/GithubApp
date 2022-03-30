import 'package:dio/dio.dart';
import 'package:flutter_github_app/models/repo_data.dart';
import 'package:flutter_github_app/models/repository.dart';
import 'package:flutter_github_app/models/user.dart';
import 'package:flutter_github_app/services/base_service.dart';
import 'package:flutter_github_app/services/mixins/network_service_mixin.dart';
import 'package:stacked/stacked.dart';

class RepoService extends BaseService<RepoData>
    with ReactiveServiceMixin, NetworkServiceMixin {
  RepoService() {
    initRxModel(
      RepoData(repo: Repository.fromJson({}), contributors: []),
    );
    listenToReactiveValues([
      super.getRxModel(),
    ]);
  }

  void setRepo(Repository repo) {
    setRxModelValue(RepoData(repo: repo, contributors: []));
  }

  Future<void> fetchRepoContributors({required String contributorsUrl}) async {
    Response? response = await networkService.getHttp(url: contributorsUrl);
    if (response != null) {
      final List<dynamic> jsonList = response.data as List<dynamic>;
      setRxModelValue(
        getRxModelValue().cloneWithMutation({
          'contributors': jsonList.map((e) => User.fromJson(e)).toList(),
        }),
      );
    }
  }
}
