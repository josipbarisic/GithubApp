import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_github_app/views/home/home_view.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.router.dart';
import 'app/locator.dart';

Future<void> main() async {
  //Load default .env file
  await dotenv.load();

  //Setup dependency injection
  setUpLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter(),
      home: HomeView(),
    );
  }
}
