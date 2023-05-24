import 'package:flutter/material.dart';
import 'package:flutter_github_app/globals/colors.dart';
import 'package:flutter_github_app/views/home/widgets/search_widget.dart';
import 'package:flutter_github_app/views/home/widgets/toggle_sort_button.dart';
import 'package:flutter_github_app/widgets/label.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';
import 'widgets/toggle_search_button.dart';

class HomeView extends StackedView<HomeViewModel> {
  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  Widget builder(
          BuildContext context, HomeViewModel viewModel, Widget? child) =>
      Scaffold(
        backgroundColor: primaryDarkColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          flexibleSpace: SafeArea(
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Image.asset(
                    'assets/logo.png',
                    color: Colors.white,
                  ),
                ),
                const Label(
                  text: 'Github App',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                ToggleSearchButton(),
                ToggleSortButton(),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SearchWidget(),
        ),
      );
}
