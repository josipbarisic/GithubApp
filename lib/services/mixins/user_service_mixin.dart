import 'package:flutter_github_app/app/locator.dart';
import 'package:flutter_github_app/services/user_service.dart';

mixin UserServiceMixin {
  UserService userService = locator<UserService>();
}
