import 'package:flutter_github_app/models/base_model.dart';

class User extends BaseModel<User> {
  User({
    required this.username,
    required this.profileUrl,
    required this.userDataUrl,
    required this.avatarUrl,
    required this.numberOfRepos,
    required this.reposUrl,
    required this.numberOfFollowers,
    required this.numberOfFollowings,
  });

  final String username;
  final String profileUrl;
  final String userDataUrl;
  final String avatarUrl;
  final int numberOfRepos;
  final String reposUrl;
  final int numberOfFollowers;
  final int numberOfFollowings;

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json['login'] ?? '',
        profileUrl: json['html_url'] ?? '',
        userDataUrl: json['url'] ?? '',
        avatarUrl: json['avatar_url'] ?? '',
        numberOfRepos: json['public_repos'] ?? 0,
        reposUrl: json['repos_url'] ?? '',
        numberOfFollowers: json['followers'] ?? 0,
        numberOfFollowings: json['following'] ?? 0,
      );

  @override
  User clone() => User(
        username: username,
        profileUrl: profileUrl,
        userDataUrl: userDataUrl,
        avatarUrl: avatarUrl,
        numberOfRepos: numberOfRepos,
        reposUrl: reposUrl,
        numberOfFollowers: numberOfFollowers,
        numberOfFollowings: numberOfFollowings,
      );

  @override
  User cloneWithMutation(Map<String, dynamic> mutation) => User(
        username: mutation['username'] ?? username,
        profileUrl: mutation['profile_url'] ?? profileUrl,
        userDataUrl: mutation['url'] ?? userDataUrl,
        avatarUrl: mutation['avatar_url'] ?? avatarUrl,
        numberOfRepos: mutation['number_of_repos'] ?? numberOfRepos,
        reposUrl: mutation['repos_url'] ?? reposUrl,
        numberOfFollowers: mutation['number_of_followers'] ?? numberOfFollowers,
        numberOfFollowings:
            mutation['number_of_followings'] ?? numberOfFollowings,
      );

  @override
  Map<String, dynamic> toJson() => {
        'login': username,
        'html_url': profileUrl,
        'url': userDataUrl,
        'avatar_url': avatarUrl,
        'public_repos': numberOfRepos,
        'repos_url': reposUrl,
        'followers': numberOfFollowers,
        'following': numberOfFollowings,
      };
}
