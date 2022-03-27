import 'package:flutter_github_app/models/base_model.dart';

class User extends BaseModel<User> {
  User({
    required this.username,
    required this.profileUrl,
    required this.avatarUrl,
    required this.numberOfRepos,
    required this.reposUrl,
    required this.numberOfFollowers,
    required this.followersUrl,
    required this.numberOfFollowings,
    required this.followingsUrl,
  });

  final String username;
  final String profileUrl;
  final String avatarUrl;
  final int numberOfRepos;
  final String reposUrl;
  final int numberOfFollowers;
  final String followersUrl;
  final int numberOfFollowings;
  final String followingsUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
      username: json['login'] ?? '',
      profileUrl: json['html_url'] ?? '',
      avatarUrl: json['avatar_url'] ?? '',
      numberOfRepos: json['public_repos'] ?? 0,
      reposUrl: json['repos_url'] ?? '',
      numberOfFollowers: json['followers'] ?? 0,
      followersUrl: json['followers_url'] ?? '',
      numberOfFollowings: json['following'] ?? 0,
      followingsUrl: json['following_url'] ?? '');

  @override
  User clone() => User(
        username: username,
        profileUrl: profileUrl,
        avatarUrl: avatarUrl,
        numberOfRepos: numberOfRepos,
        reposUrl: reposUrl,
        numberOfFollowers: numberOfFollowers,
        followersUrl: followersUrl,
        numberOfFollowings: numberOfFollowings,
        followingsUrl: followingsUrl,
      );

  @override
  User cloneWithMutation(Map<String, dynamic> mutation) => User(
        username: mutation['username'] ?? username,
        profileUrl: mutation['profile_url'] ?? profileUrl,
        avatarUrl: mutation['avatar_url'] ?? avatarUrl,
        numberOfRepos: mutation['number_of_repos'] ?? numberOfRepos,
        reposUrl: mutation['repos_url'] ?? reposUrl,
        numberOfFollowers: mutation['number_of_followers'] ?? numberOfFollowers,
        followersUrl: mutation['followers_url'] ?? followersUrl,
        numberOfFollowings:
            mutation['number_of_followings'] ?? numberOfFollowings,
        followingsUrl: mutation['followings_url'] ?? followingsUrl,
      );

  @override
  Map<String, dynamic> toJson() => {
        'login': username,
        'html_url': profileUrl,
        'avatar_url': avatarUrl,
        'public_repos': numberOfRepos,
        'repos_url': reposUrl,
        'followers': numberOfFollowers,
        'followers_url': followersUrl,
        'following': numberOfFollowings,
        'following_url': followingsUrl,
      };
}
