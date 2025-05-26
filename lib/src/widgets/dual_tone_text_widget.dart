import 'package:flutter/material.dart';

/// Defines the direction in which the text will be split.
enum DualToneDirection { vertical, horizontal }

/// A widget that displays a [Text] widget with a dual-tone color effect.
///
/// You can split the text either vertically (top/bottom) or horizontally (left/right)
/// using the [direction] property.
///
/// Example usage:
/// ```dart
/// DualToneText(
///   text: Text(
///     'WELCOME',
///     style: TextStyle(
///       fontSize: 60,
///       fontWeight: FontWeight.bold,
///       color: Colors.white,
///     ),
///   ),
///   bottomColor: Colors.orange,
///   direction: DualToneDirection.horizontal,
///   splitPercentage: 0.5,
/// )
/// ```
class DualToneText extends StatelessWidget {
  /// The [Text] widget to display.
  final Text text;

  /// The color to be applied to the second half (bottom or right) of the text.
  final Color bottomColor;

  /// The split ratio between the first and second colors.
  ///
  /// Should be between `0.0` and `1.0`. Default is `0.5`.
  final double splitPercentage;

  /// The direction in which the gradient should be applied.
  ///
  /// Default is [DualToneDirection.vertical].
  final DualToneDirection direction;

  const DualToneText({
    super.key,
    required this.text,
    required this.bottomColor,
    this.splitPercentage = 0.5,
    this.direction = DualToneDirection.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        final width = bounds.width;
        final height = bounds.height;

        // Determine gradient direction
        final isVertical = direction == DualToneDirection.vertical;
        final gradient = LinearGradient(
          begin: isVertical ? Alignment.topCenter : Alignment.centerLeft,
          end: isVertical ? Alignment.bottomCenter : Alignment.centerRight,
          stops: [splitPercentage, splitPercentage],
          colors: [
            text.style?.color ?? Colors.black, // top or left color
            bottomColor, // bottom or right color
          ],
        );

        return gradient.createShader(Rect.fromLTWH(0, 0, width, height));
      },
      child: text,
    );
  }
}
