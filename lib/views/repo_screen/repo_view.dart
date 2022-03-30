import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_app/globals/colors.dart';
import 'package:flutter_github_app/models/repository.dart';
import 'package:flutter_github_app/views/home/widgets/repo_item_info.dart';
import 'package:flutter_github_app/views/repo_screen/repo_viewmodel.dart';
import 'package:flutter_github_app/widgets/browser_link_button.dart';
import 'package:flutter_github_app/widgets/label.dart';
import 'package:stacked/stacked.dart';

import 'widgets/contributors_section.dart';

class RepoView extends StatelessWidget {
  const RepoView({required this.repo, Key? key}) : super(key: key);

  final Repository repo;

  @override
  Widget build(BuildContext context) => ViewModelBuilder.nonReactive(
        viewModelBuilder: () => RepoViewModel(),
        onModelReady: (RepoViewModel viewModel) async => viewModel.init(repo),
        builder: (
          BuildContext context,
          RepoViewModel viewModel,
          _,
        ) =>
            Scaffold(
          backgroundColor: primaryDarkColor,
          appBar: AppBar(
            backgroundColor: primaryColor,
            leading: IconButton(
              onPressed: viewModel.navigateBack,
              icon: const Icon(Icons.arrow_back_ios),
            ),
            flexibleSpace: const SafeArea(
              child: Center(
                child: Label(
                  text: 'Github App',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText.rich(
                      TextSpan(
                        text: repo.owner.username,
                        children: [
                          const TextSpan(
                            text: ' / ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: repo.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 21,
                      ),
                      maxLines: 1,
                      minFontSize: 12,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Label(
                      text: 'About',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Label(
                      text: repo.description,
                      maxLines: 4,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RepoItemInfo(
                      iconData: Icons.star_border_rounded,
                      labelText: 'Stars: ${repo.numberOfStars}',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RepoItemInfo(
                      iconData: Icons.code,
                      labelText: repo.language,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RepoItemInfo(
                      iconData: Icons.call_split,
                      labelText: 'Forks: ${repo.numberOfForks}',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RepoItemInfo(
                      iconData: Icons.build_circle_outlined,
                      labelText: 'Issues: ${repo.numberOfIssues}',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Label(
                      text: 'Created: ${repo.formattedCreatedAt}',
                      textColor: accentColor,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Label(
                      text: 'Last updated: ${repo.formattedUpdatedAt}',
                      textColor: accentColor,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: BrowserLinkButton(
                        btnText: 'Open in web browser',
                        onTap: viewModel.openRepoInBrowser,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ContributorsSection(),
                  ],
                ),
              )
            ]),
          ),
        ),
      );
}
