import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final EdgeInsets padding;
  final BoxDecoration boxDecoration;

  const TextContainer({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.boxDecoration,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: double.infinity);

    return Container(
      padding: padding,
      width: textPainter.width + padding.horizontal,
      height: textPainter.height + padding.vertical,
      decoration: boxDecoration,
      child: Text(
        text,
        style: textStyle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
