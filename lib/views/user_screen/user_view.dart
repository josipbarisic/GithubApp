import 'package:flutter/material.dart';
import 'package:flutter_github_app/globals/colors.dart';
import 'package:flutter_github_app/models/user.dart';
import 'package:flutter_github_app/views/user_screen/user_viewmodel.dart';
import 'package:flutter_github_app/widgets/label.dart';
import 'package:stacked/stacked.dart';

// ignore_for_file: use_key_in_widget_constructors
class UserView extends StatelessWidget {
  const UserView({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) => ViewModelBuilder.nonReactive(
        viewModelBuilder: () => UserViewModel(),
        builder: (
          BuildContext context,
          UserViewModel viewModel,
          _,
        ) =>
            Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            leading: IconButton(
              onPressed: viewModel.navigateBack,
              icon: const Icon(Icons.arrow_back_ios),
            ),
            flexibleSpace: const SafeArea(
              child: Center(
                child: Label(
                  text: 'Github App',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: Container(
            color: primaryDarkColor,
          ),
        ),
      );
}
