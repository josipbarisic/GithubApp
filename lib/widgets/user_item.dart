import 'package:flutter/material.dart';
import 'package:flutter_github_app/models/user.dart';

import 'label.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    required this.user,
    required this.navigateToUserScreen,
    this.avatarSize = 30,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.showOwnerLabel = false,
    Key? key,
  }) : super(key: key);

  final User user;
  final Function() navigateToUserScreen;
  final double avatarSize;
  final double fontSize;
  final FontWeight fontWeight;
  final bool showOwnerLabel;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: navigateToUserScreen,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                user.avatarUrl,
                fit: BoxFit.fill,
                width: avatarSize,
                height: avatarSize,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Label(
              text: '${user.username}${showOwnerLabel ? ' (Owner)' : ''}',
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      );
}
