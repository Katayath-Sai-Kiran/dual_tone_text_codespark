import 'package:flutter/material.dart';

/// Splits the text by character index, rendering
/// first N characters with [topColor] and the rest with [bottomColor].
///
/// Useful for simple split coloring based on character count.
class DualToneTextByChar extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color topColor;
  final Color bottomColor;
  final int splitAt;

  /// [text]: The full string to render.
  /// [style]: Base text style.
  /// [topColor]: Color applied to characters before [splitAt].
  /// [bottomColor]: Color applied to characters after [splitAt].
  /// [splitAt]: The character index to split at.
  const DualToneTextByChar({
    super.key,
    required this.text,
    required this.style,
    required this.topColor,
    required this.bottomColor,
    required this.splitAt,
  });

  @override
  Widget build(BuildContext context) {
    final topText = text.substring(0, splitAt.clamp(0, text.length));
    final bottomText = text.substring(splitAt.clamp(0, text.length));

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: topText,
            style: style.copyWith(color: topColor),
          ),
          TextSpan(
            text: bottomText,
            style: style.copyWith(color: bottomColor),
          ),
        ],
      ),
    );
  }
}
