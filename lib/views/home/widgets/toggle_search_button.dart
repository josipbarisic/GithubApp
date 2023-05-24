import 'package:flutter/material.dart';
import 'package:flutter_github_app/views/home/home_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

// ignore: use_key_in_widget_constructors
class ToggleSearchButton extends StackedHookView<HomeViewModel> {
  @override
  Widget builder(BuildContext context, HomeViewModel viewModel) =>
      !viewModel.firstUse
          ? IconButton(
              onPressed: () async {
                if (viewModel.showSearchInput) {
                  viewModel.isSearchAnimated = false;
                } else {
                  viewModel.isSearchAnimated = true;
                }
                viewModel.showSearchInput = !viewModel.showSearchInput;
              },
              icon: Icon(
                viewModel.showSearchInput ? Icons.search_off : Icons.search,
                color: Colors.white,
              ),
            )
          : const Offstage();
}
