import 'package:flutter/material.dart';
import 'package:flutter_github_app/views/home/widgets/repository_item.dart';
import 'package:flutter_github_app/views/user_screen/user_viewmodel.dart';
import 'package:flutter_github_app/widgets/label.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

// ignore: use_key_in_widget_constructors
class UserReposSection extends HookViewModelWidget<UserViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, UserViewModel viewModel) =>
      viewModel.isBusy
          ? const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: CircularProgressIndicator(),
              ),
            )
          : viewModel.userRepos.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: viewModel.userRepos.length,
                    itemBuilder: (context, index) => RepositoryItem(
                      repo: viewModel.userRepos[index],
                      onUserTap: () {},
                      onRepoTap: () => viewModel
                          .navigateToRepoScreen(viewModel.userRepos[index]),
                      isUserProfileRepo: true,
                    ),
                  ),
                )
              : const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Label(
                      text: 'User has no public repositories.',
                      fontSize: 18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
}
