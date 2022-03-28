import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({
    required this.text,
    this.textColor = Colors.white,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontStyle,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextStyle? fontStyle;
  final TextAlign textAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) => AutoSizeText(
        text,
        style: fontStyle ??
            TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        maxLines: maxLines,
      );
}
