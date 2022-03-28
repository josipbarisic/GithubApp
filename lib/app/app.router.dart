// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../models/user.dart';
import '../views/user_screen/user_view.dart';

class Routes {
  static const String userView = '/user-view';
  static const all = <String>{
    userView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.userView, page: UserView),
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
