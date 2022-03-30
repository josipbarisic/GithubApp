import 'package:flutter_github_app/app/locator.dart';
import 'package:flutter_github_app/services/repo_service.dart';

mixin RepoServiceMixin {
  RepoService repoService = locator<RepoService>();
}
