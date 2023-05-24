import 'package:flutter/material.dart';
import 'package:flutter_github_app/views/home/home_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class ToggleSortButton extends StackedHookView<HomeViewModel> {
  @override
  Widget builder(BuildContext context, HomeViewModel viewModel) =>
      !viewModel.firstUse
          ? IconButton(
              onPressed: () => viewModel.showSort = !viewModel.showSort,
              icon: Stack(
                children: [
                  const Icon(
                    Icons.sort,
                    color: Colors.white,
                  ),
                  viewModel.showSort
                      ? const Positioned(
                          top: 8,
                          left: 10,
                          child: Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 15,
                          ),
                        )
                      : const Offstage(),
                ],
              ),
            )
          : const Offstage();
}
