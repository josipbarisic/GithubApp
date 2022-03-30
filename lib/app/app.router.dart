// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../models/repository.dart';
import '../models/user.dart';
import '../views/repo_screen/repo_view.dart';
import '../views/user_screen/user_view.dart';

class Routes {
  static const String userView = '/user-view';
  static const String repoView = '/repo-view';
  static const all = <String>{
    userView,
    repoView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.userView, page: UserView),
    RouteDef(Routes.repoView, page: RepoView),
  ];

  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    UserView: (data) {
      var args = data.getArgs<UserViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => UserView(user: args.user),
        settings: data,
      );
    },
    RepoView: (data) {
      var args = data.getArgs<RepoViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => RepoView(
          repo: args.repo,
          key: args.key,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// UserView arguments holder class
class UserViewArguments {
  final User user;

  UserViewArguments({required this.user});
}

/// RepoView arguments holder class
class RepoViewArguments {
  final Repository repo;
  final Key? key;

  RepoViewArguments({required this.repo, this.key});
}
