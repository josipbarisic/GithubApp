import 'package:flutter_github_app/models/base_model.dart';
import 'package:flutter_github_app/models/repository.dart';

import 'user.dart';

class RepoData extends BaseModel<RepoData> {
  RepoData({
    required this.repo,
    required this.contributors,
  });

  final Repository repo;
  final List<User> contributors;

  @override
  RepoData clone() => RepoData(repo: repo, contributors: contributors);

  @override
  RepoData cloneWithMutation(Map<String, dynamic> mutation) => RepoData(
        repo: mutation['repo'] ?? repo,
        contributors: mutation['contributors'] ?? contributors,
      );

  @override
  Map<String, dynamic> toJson() => {
        'repo': repo,
        'contributors': contributors,
      };
}
