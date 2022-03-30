import 'package:flutter_github_app/models/base_model.dart';
import 'package:intl/intl.dart';

import 'user.dart';

class Repository extends BaseModel<Repository> {
  Repository({
    required this.name,
    required this.fullName,
    required this.owner,
    required this.repoUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.language,
    required this.numberOfForks,
    required this.forksUrl,
    required this.numberOfStars,
    required this.numberOfIssues,
    required this.description,
    required this.contributorsUrl,
  });

  final String name;
  final String fullName;
  final User owner;
  final String repoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String language;
  final int numberOfForks;
  final String forksUrl;
  final int numberOfStars;
  final int numberOfIssues;
  final String description;
  final String contributorsUrl;

  String get formattedCreatedAt => DateFormat('dd MMM y').format(createdAt);

  String get formattedUpdatedAt => DateFormat('dd MMM y').format(updatedAt);

  factory Repository.fromJson(Map<String, dynamic> json) => Repository(
        name: json['name'] ?? '',
        fullName: json['full_name'] ?? '',
        owner: User.fromJson(json['owner'] ?? {}),
        repoUrl: json['html_url'] ?? '',
        createdAt:
            DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
        updatedAt:
            DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
        language: json['language'] ?? 'N/A',
        numberOfForks: json['forks'] ?? 0,
        forksUrl: json['forks_url'] ?? '',
        numberOfStars: json['stargazers_count'] ?? 0,
        numberOfIssues: json['open_issues'] ?? 0,
        description: json['description'] ?? 'N/A',
        contributorsUrl: json['contributors_url'] ?? '',
      );

  @override
  Repository clone() => Repository(
        name: name,
        fullName: fullName,
        owner: owner,
        repoUrl: repoUrl,
        createdAt: createdAt,
        updatedAt: updatedAt,
        language: language,
        numberOfForks: numberOfForks,
        forksUrl: forksUrl,
        numberOfStars: numberOfStars,
        numberOfIssues: numberOfIssues,
        description: description,
        contributorsUrl: contributorsUrl,
      );

  @override
  Repository cloneWithMutation(Map<String, dynamic> mutation) => Repository(
        name: mutation['name'] ?? name,
        fullName: mutation['full_name'] ?? fullName,
        owner: mutation['owner'] ?? owner,
        repoUrl: mutation['repo_url'] ?? repoUrl,
        createdAt: mutation['created_at'] ?? createdAt,
        updatedAt: mutation['updated_at'] ?? updatedAt,
        language: mutation['language'] ?? language,
        numberOfForks: mutation['number_of_forks'] ?? numberOfForks,
        forksUrl: mutation['forks_url'] ?? forksUrl,
        numberOfStars: mutation['number_of_stars'] ?? numberOfStars,
        numberOfIssues: mutation['number_of_issues'] ?? numberOfIssues,
        description: mutation['description'] ?? description,
        contributorsUrl: mutation['contributors_url'] ?? contributorsUrl,
      );

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'full_name': fullName,
        'owner': owner.toJson(),
        'html_url': repoUrl,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'language': language,
        'forks': numberOfForks,
        'forks_url': forksUrl,
        'stargazers_count': numberOfStars,
        'open_issues': numberOfIssues,
        'description': description,
        'contributors_url': contributorsUrl,
      };
}
