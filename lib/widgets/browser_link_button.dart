import 'package:flutter/material.dart';
import 'package:flutter_github_app/globals/colors.dart';

import 'label.dart';

// ignore_for_file: use_key_in_widget_constructors
class BrowserLinkButton extends StatelessWidget {
  const BrowserLinkButton({required this.btnText, required this.onTap});

  final String btnText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: accentColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Label(
                text: btnText,
                fontSize: 15,
                textColor: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.open_in_new,
                color: Colors.white,
                size: 16,
              ),
            ],
          ),
        ),
      );
}
