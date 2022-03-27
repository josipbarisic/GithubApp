import 'package:flutter/material.dart';
import 'package:flutter_github_app/globals/colors.dart';
import 'package:flutter_github_app/widgets/label.dart';

class RepoItemInfo extends StatelessWidget {
  const RepoItemInfo({
    required this.iconData,
    this.iconColor = accentColor,
    required this.labelText,
    this.textColor = accentColor,
    Key? key,
  }) : super(key: key);

  final IconData iconData;
  final Color iconColor;
  final String labelText;
  final Color textColor;

  @override
  Widget build(BuildContext context) => Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(
            iconData,
            color: iconColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Label(
            text: labelText,
            textColor: textColor,
          ),
        ],
      );
}
