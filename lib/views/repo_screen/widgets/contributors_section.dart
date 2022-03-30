import 'package:flutter/material.dart';
import 'package:flutter_github_app/views/repo_screen/repo_viewmodel.dart';
import 'package:flutter_github_app/widgets/label.dart';
import 'package:flutter_github_app/widgets/user_item.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

// ignore: use_key_in_widget_constructors
class ContributorsSection extends HookViewModelWidget<RepoViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, RepoViewModel viewModel) =>
      viewModel.isBusy
          ? const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: CircularProgressIndicator(),
              ),
            )
          : viewModel.contributors.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Label(
                      text: 'Contributors:',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: viewModel.contributors.length,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: UserItem(
                          user: viewModel.contributors[index],
                          navigateToUserScreen: () =>
                              viewModel.navigateToUserScreen(
                                  viewModel.contributors[index]),
                          avatarSize: 40,
                          showOwnerLabel:
                              viewModel.contributors[index].username ==
                                  viewModel.repo.owner.username,
                        ),
                      ),
                    ),
                  ],
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
