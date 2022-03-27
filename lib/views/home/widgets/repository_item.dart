import 'package:flutter/material.dart';
import 'package:flutter_github_app/globals/colors.dart';
import 'package:flutter_github_app/models/repository.dart';
import 'package:flutter_github_app/views/home/widgets/repo_item_info.dart';
import 'package:flutter_github_app/widgets/label.dart';

class RepositoryItem extends StatelessWidget {
  const RepositoryItem({
    required this.repo,
    Key? key,
  }) : super(key: key);

  final Repository repo;

  @override
  Widget build(BuildContext context) => Container(
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
              text: repo.name,
              fontSize: 16,
              textColor: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    repo.owner.avatarUrl,
                    fit: BoxFit.fill,
                    width: 30,
                    height: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Label(text: repo.owner.username),
              ],
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
                text: 'Updated at: ${repo.formattedUpdatedAt}',
                textColor: accentColor,
              ),
            ),
          ],
        ),
      );
}
