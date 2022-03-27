import 'package:flutter/material.dart';
import 'package:flutter_github_app/globals/colors.dart';
import 'package:flutter_github_app/models/repository.dart';
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
          border: Border.all(color: primaryDarkColor),
          color: primaryColor,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Label(
                  text: repo.name,
                  fontSize: 16,
                  textColor: Colors.blue,
                ),
              ],
            ),
            Row(
              children: [
                Image.network(
                  repo.owner.avatarUrl,
                  height: 30,
                ),
                Label(text: repo.owner.username),
                const Spacer(),
              ],
            ),
          ],
        ),
      );
}
