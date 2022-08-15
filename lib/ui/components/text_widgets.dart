import 'package:flutter/material.dart';

class FlexibleText extends StatelessWidget {
  /// [FlexibleText] is a text widget wrapped in [FittedBox]
  /// for more responsiveness and readability in visual assessability
  const FlexibleText({
    Key? key,
    required this.text,
    this.style,
    this.flexible = true,
    this.flex = 1,
    this.fit = BoxFit.scaleDown,
  }) : super(key: key);

  final String text;
  final bool flexible;
  final int flex;
  final BoxFit fit;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    Widget child = FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(text, style: style),
    );
    return flexible ? Flexible(child: child) : child;
  }
}
