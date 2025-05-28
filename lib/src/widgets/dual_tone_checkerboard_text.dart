import 'package:flutter/material.dart';

/// Renders text with alternating colors per character.
/// Example: "HELLO" → H (color1), E (color2), L (color1), L (color2), O (color1)
class DualToneCheckerboardText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color color1;
  final Color color2;

  /// [text]: The string to display.
  /// [style]: Base text style.
  /// [color1]: Color for even indexed characters.
  /// [color2]: Color for odd indexed characters.
  const DualToneCheckerboardText({
    super.key,
    required this.text,
    required this.style,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans = [];
    for (int i = 0; i < text.length; i++) {
      spans.add(
        TextSpan(
          text: text[i],
          style: style.copyWith(color: i.isEven ? color1 : color2),
        ),
      );
    }

    return RichText(text: TextSpan(children: spans));
  }
}
