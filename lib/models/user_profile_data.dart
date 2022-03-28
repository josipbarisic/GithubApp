import 'package:flutter_github_app/models/base_model.dart';
import 'package:flutter_github_app/models/repository.dart';

import 'user.dart';

class UserProfileData extends BaseModel<UserProfileData> {
  UserProfileData({
    required this.user,
    required this.userRepos,
  });

  final User user;
  final List<Repository> userRepos;

  @override
  UserProfileData clone() => UserProfileData(user: user, userRepos: userRepos);

  @override
  UserProfileData cloneWithMutation(Map<String, dynamic> mutation) =>
      UserProfileData(
        user: mutation['user'] ?? user,
        userRepos: mutation['user_repos'] ?? userRepos,
      );

  @override
  Map<String, dynamic> toJson() => {
        'user': user,
        'user_repos': userRepos,
      };
}
