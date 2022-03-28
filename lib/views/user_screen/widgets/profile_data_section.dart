import 'package:flutter/material.dart';
import 'package:flutter_github_app/globals/colors.dart';
import 'package:flutter_github_app/views/user_screen/user_viewmodel.dart';
import 'package:flutter_github_app/widgets/browser_link_button.dart';
import 'package:flutter_github_app/widgets/label.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

// ignore: use_key_in_widget_constructors
class ProfileDataSection extends HookViewModelWidget<UserViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, UserViewModel viewModel) =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    color: accentColor.withOpacity(0.2),
                    child: Image.network(
                      viewModel.userData.avatarUrl,
                      fit: BoxFit.fill,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 150),
                      child: Label(
                        text:
                            'Followers: ${viewModel.userData.numberOfFollowers}',
                        fontSize: 15,
                        textColor: accentColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 150),
                      child: Label(
                        text:
                            'Following: ${viewModel.userData.numberOfFollowings}',
                        fontSize: 15,
                        textColor: accentColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 150),
                      child: Label(
                        text:
                            'No. of repos: ${viewModel.userData.numberOfRepos}',
                        fontSize: 15,
                        textColor: accentColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BrowserLinkButton(
                      btnText: 'Profile',
                      onTap: viewModel.openProfileInBrowser,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Label(
              text: viewModel.userData.username,
              fontSize: 21,
              textColor: accentColor,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 20,
            ),
            Label(
              text: 'Repositories:',
              fontSize: 15,
              textColor: accentColor.withOpacity(0.5),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      );
}
