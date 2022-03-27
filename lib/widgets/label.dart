import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({
    required this.text,
    this.textColor = Colors.white,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontStyle,
    this.textAlign = TextAlign.start,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextStyle? fontStyle;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: fontStyle ??
            TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
        textAlign: textAlign,
      );
}
