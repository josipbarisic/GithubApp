import 'package:flutter_github_app/models/base_model.dart';
import 'package:intl/intl.dart';

import 'user.dart';

class Repository extends BaseModel<Repository> {
  Repository({
    required this.name,
    required this.owner,
    required this.repoUrl,
    required this.updatedAt,
    required this.language,
    required this.numberOfForks,
    required this.forksUrl,
    required this.numberOfStars,
    required this.numberOfIssues,
  });

  final String name;
  final User owner;
  final String repoUrl;
  final DateTime updatedAt;
  final String language;
  final int numberOfForks;
  final String forksUrl;
  final int numberOfStars;
  final int numberOfIssues;

  String get formattedUpdatedAt => DateFormat('dd MMM y').format(updatedAt);

  factory Repository.fromJson(Map<String, dynamic> json) => Repository(
      name: json['full_name'] ?? '',
      owner: User.fromJson(json['owner']),
      repoUrl: json['html_url'] ?? '',
      updatedAt: DateTime.parse(json['updated_at']),
      language: json['language'] ?? '',
      numberOfForks: json['forks'],
      forksUrl: json['forks_url'] ?? '',
      numberOfStars: json['stargazers_count'],
      numberOfIssues: json['open_issues']);

  @override
  Repository clone() => Repository(
        name: name,
        owner: owner,
        repoUrl: repoUrl,
        updatedAt: updatedAt,
        language: language,
        numberOfForks: numberOfForks,
        forksUrl: forksUrl,
        numberOfStars: numberOfStars,
        numberOfIssues: numberOfIssues,
      );

  @override
  Repository cloneWithMutation(Map<String, dynamic> mutation) => Repository(
        name: mutation['name'] ?? name,
        owner: mutation['owner'] ?? owner,
        repoUrl: mutation['repo_url'] ?? repoUrl,
        updatedAt: mutation['updated_at'] ?? updatedAt,
        language: mutation['language'] ?? language,
        numberOfForks: mutation['number_of_forks'] ?? numberOfForks,
        forksUrl: mutation['forks_url'] ?? forksUrl,
        numberOfStars: mutation['number_of_stars'] ?? numberOfStars,
        numberOfIssues: mutation['number_of_issues'] ?? numberOfIssues,
      );

  @override
  Map<String, dynamic> toJson() => {
        'full_name': name,
        'owner': owner.toJson(),
        'html_url': repoUrl,
        'updated_at': updatedAt.toIso8601String(),
        'language': language,
        'forks': numberOfForks,
        'forks_url': forksUrl,
        'stargazers_count': numberOfStars,
        'open_issues': numberOfIssues,
      };
}
