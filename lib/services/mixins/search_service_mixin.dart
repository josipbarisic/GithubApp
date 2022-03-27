import 'package:flutter_github_app/app/locator.dart';
import 'package:flutter_github_app/services/search_service.dart';

mixin SearchServiceMixin {
  SearchService searchService = locator<SearchService>();
}
