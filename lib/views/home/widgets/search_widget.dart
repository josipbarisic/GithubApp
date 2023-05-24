import 'package:flutter/material.dart';
import 'package:flutter_github_app/views/home/home_viewmodel.dart';
import 'package:flutter_github_app/views/home/widgets/repo_results_sort.dart';
import 'package:flutter_github_app/views/home/widgets/search_input.dart';
import 'package:flutter_github_app/views/home/widgets/search_results_section.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class SearchWidget extends StackedHookView<HomeViewModel> {
  @override
  Widget builder(BuildContext context, HomeViewModel viewModel) {
    viewModel.animationController =
        useAnimationController(duration: const Duration(milliseconds: 100));

    viewModel.animation = useMemoized<Animation<double>>(() =>
        Tween<double>(begin: 0, end: 200).animate(CurvedAnimation(
            parent: viewModel.animationController, curve: Curves.linear))
          ..addListener(() {
            viewModel.notifyListeners();
          }));
    return GestureDetector(
      onTap: viewModel.closeSearchWidget,
      behavior: HitTestBehavior.translucent,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SearchInput(
            animationController: viewModel.animationController,
            animation: viewModel.animation,
          ),
          RepoResultsSort(),
          Flexible(
            fit: FlexFit.loose,
            child: SearchResultsSection(),
          )
        ],
      ),
    );
  }
}
