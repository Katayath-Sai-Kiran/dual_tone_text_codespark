import 'package:flutter/material.dart';

/// Alternates colors per word in the text.
/// Useful for highlighting or stylizing text word-by-word.
class DualToneWordSplitText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color color1;
  final Color color2;

  /// [text]: Input string.
  /// [style]: Base style for text.
  /// [color1]: Color for even indexed words.
  /// [color2]: Color for odd indexed words.
  const DualToneWordSplitText({
    super.key,
    required this.text,
    required this.style,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    final words = text.split(' ');
    List<TextSpan> spans = [];

    for (int i = 0; i < words.length; i++) {
      spans.add(
        TextSpan(
          text: words[i] + (i == words.length - 1 ? '' : ' '),
          style: style.copyWith(color: i.isEven ? color1 : color2),
        ),
      );
    }

    return RichText(text: TextSpan(children: spans));
  }
}
