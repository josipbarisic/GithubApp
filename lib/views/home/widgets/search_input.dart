import 'package:flutter/material.dart';
import 'package:flutter_github_app/globals/colors.dart';
import 'package:flutter_github_app/views/home/home_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class SearchInput extends StackedHookView<HomeViewModel> {
  const SearchInput({
    required this.animationController,
    required this.animation,
    Key? key,
  }) : super(key: key);

  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel) =>
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
                                onSubmitted: viewModel.fetchRepositories,
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
                                  viewModel.fetchRepositories(null);
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
                    ],
                  ),
                ],
              ),
            )
          : const Offstage();
}
