import 'package:flutter/material.dart';
import 'package:flutter_github_app/views/home/home_viewmodel.dart';
import 'package:flutter_github_app/widgets/label.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'repository_item.dart';

// ignore: use_key_in_widget_constructors
class SearchResultsSection extends HookViewModelWidget<HomeViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) =>
      viewModel.isBusy
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: CircularProgressIndicator(),
              ),
            )
          : viewModel.repoResults.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: viewModel.repoResults.length,
                        itemBuilder: (context, index) => RepositoryItem(
                          repo: viewModel.sortedRepoResults[index],
                          onUserTap: () => viewModel.navigateToUserScreen(
                              viewModel.sortedRepoResults[index].owner),
                          onRepoTap: () => viewModel.navigateToRepoScreen(
                            viewModel.sortedRepoResults[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : viewModel.showSearchInput && viewModel.firstUse
                  ? const Offstage()
                  : const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Label(
                          text:
                              'Unfortunately there are no results for your query.',
                          fontSize: 18,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
}
