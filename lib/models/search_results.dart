import 'package:flutter_github_app/models/base_model.dart';

import 'repository.dart';

class SearchResults extends BaseModel<SearchResults> {
  SearchResults({
    required this.repoResults,
  });

  final List<Repository> repoResults;

  @override
  SearchResults clone() => SearchResults(repoResults: repoResults);

  @override
  SearchResults cloneWithMutation(Map<String, dynamic> mutation) =>
      SearchResults(
        repoResults: mutation['repo_results'] ?? repoResults,
      );

  @override
  Map<String, dynamic> toJson() => {
        'repo_results': repoResults.asMap(),
      };
}
