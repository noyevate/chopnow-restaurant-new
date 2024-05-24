import 'package:flutter/material.dart';

class ReuseableText extends StatelessWidget {
  final String title;
  final TextStyle style;
  final TextAlign? textAlign;

  const ReuseableText({
    Key? key,
    required this.title,
    required this.style,
    this.textAlign
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style,
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
