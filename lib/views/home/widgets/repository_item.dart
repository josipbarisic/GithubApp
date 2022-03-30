import 'package:flutter/material.dart';
import 'package:flutter_github_app/globals/colors.dart';
import 'package:flutter_github_app/models/repository.dart';
import 'package:flutter_github_app/views/home/widgets/repo_item_info.dart';
import 'package:flutter_github_app/widgets/label.dart';
import 'package:flutter_github_app/widgets/user_item.dart';

class RepositoryItem extends StatelessWidget {
  const RepositoryItem({
    required this.repo,
    required this.onUserTap,
    required this.onRepoTap,
    this.isUserProfileRepo = false,
    Key? key,
  }) : super(key: key);

  final Repository repo;
  final Function() onUserTap;
  final Function() onRepoTap;
  final bool isUserProfileRepo;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onRepoTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(
              color: accentColor.withOpacity(0.2),
            ),
            color: primaryColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Label(
                text: isUserProfileRepo ? repo.name : repo.fullName,
                fontSize: 16,
                textColor: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
              isUserProfileRepo
                  ? Label(
                      text: repo.description,
                      textColor: accentColor,
                      maxLines: 2,
                    )
                  : UserItem(
                      user: repo.owner,
                      navigateToUserScreen: onUserTap,
                    ),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                direction: Axis.horizontal,
                spacing: 20,
                children: [
                  RepoItemInfo(
                    iconData: Icons.star_border_rounded,
                    labelText: repo.numberOfStars.toString(),
                  ),
                  RepoItemInfo(
                    iconData: Icons.code,
                    labelText: repo.language,
                  ),
                  RepoItemInfo(
                    iconData: Icons.call_split,
                    labelText: repo.numberOfForks.toString(),
                  ),
                  RepoItemInfo(
                    iconData: Icons.build_circle_outlined,
                    labelText: repo.numberOfIssues.toString(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Label(
                  text: 'Last updated: ${repo.formattedUpdatedAt}',
                  textColor: accentColor,
                ),
              ),
            ],
          ),
        ),
      );
}
