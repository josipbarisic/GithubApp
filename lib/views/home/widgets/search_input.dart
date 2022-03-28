import 'package:flutter/material.dart';
import 'package:flutter_github_app/globals/colors.dart';
import 'package:flutter_github_app/models/enums/repo_sort.dart';
import 'package:flutter_github_app/views/home/home_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class SearchInput extends HookViewModelWidget<HomeViewModel> {
  const SearchInput({
    required this.animationController,
    required this.animation,
    Key? key,
  }) : super(key: key);

  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) =>
      viewModel.showSearchInput
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: animation.value,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 5),
                              child: TextField(
                                onChanged: (String searchInput) {
                                  viewModel.searchInput = searchInput;
                                },
                                focusNode: viewModel.searchInputFocusNode,
                                cursorColor: Colors.white12,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search...',
                                  hintStyle: TextStyle(color: Colors.white54),
                                ),
                                onSubmitted: (_) =>
                                    viewModel.fetchRepositories(),
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: animation.value > 0
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(0),
                                      bottomLeft: Radius.circular(0),
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    )
                                  : BorderRadius.circular(30),
                            ),
                            child: IconButton(
                              onPressed: () {
                                if (!viewModel.isSearchAnimated) {
                                  animationController.forward().then((value) =>
                                      viewModel.searchInputFocusNode
                                          .requestFocus());
                                  viewModel.isSearchAnimated = true;
                                } else {
                                  viewModel.fetchRepositories();
                                }
                              },
                              splashColor: viewModel.isSearchAnimated
                                  ? primaryColor
                                  : Colors.transparent,
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (viewModel.repoResults.length > 1)
                        DropdownButton<String>(
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
                    ],
                  ),
                ],
              ),
            )
          : const Offstage();
}
