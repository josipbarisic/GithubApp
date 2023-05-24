import 'package:flutter/material.dart';
import 'package:flutter_github_app/globals/colors.dart';
import 'package:flutter_github_app/models/enums/repo_sort.dart';
import 'package:flutter_github_app/views/home/home_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class RepoResultsSort extends StackedHookView<HomeViewModel> {
  @override
  Widget builder(BuildContext context, HomeViewModel viewModel) =>
      viewModel.repoResults.length > 1 && viewModel.showSort
          ? DropdownButton<String>(
              borderRadius: BorderRadius.circular(20),
              value: viewModel.sortValue,
              onChanged: viewModel.changeSortValue,
              style: const TextStyle(
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
              dropdownColor: primaryColor,
              isDense: false,
              items: [
                DropdownMenuItem(
                  child: const Text('Best match'),
                  value: RepoSort.bestMatch.name,
                ),
                DropdownMenuItem(
                  child: const Text('Most stars'),
                  value: RepoSort.mostStars.name,
                ),
                DropdownMenuItem(
                  child: const Text('Fewest stars'),
                  value: RepoSort.fewestStars.name,
                ),
                DropdownMenuItem(
                  child: const Text('Most forks'),
                  value: RepoSort.mostForks.name,
                ),
                DropdownMenuItem(
                  child: const Text('Fewest forks'),
                  value: RepoSort.fewestForks.name,
                ),
                DropdownMenuItem(
                  child: const Text('Recently updated'),
                  value: RepoSort.recentlyUpdate.name,
                ),
                DropdownMenuItem(
                  child: const Text('Least recently updated'),
                  value: RepoSort.leastRecentlyUpdate.name,
                ),
              ],
            )
          : const SizedBox();
}
