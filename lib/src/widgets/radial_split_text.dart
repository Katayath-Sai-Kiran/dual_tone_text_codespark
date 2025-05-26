import 'package:flutter/material.dart';

/// A widget that displays [Text] with a sharp radial dual-tone split.
/// 
/// The split occurs as a solid circle at the center with one color, and the outside in another.
class RadialSplitText extends StatelessWidget {
  final Text text;
  final Color outerColor;
  final double radiusCutoff;

  /// [text] - The text to be rendered.
  /// [outerColor] - The color outside the radial split.
  /// [radiusCutoff] - The radius (0.0 - 1.0) at which to switch from text color to outerColor.
  const RadialSplitText({
    super.key,
    required this.text,
    required this.outerColor,
    this.radiusCutoff = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return RadialGradient(
          center: Alignment.center,
          radius: 1.0,
          colors: [
            text.style?.color ?? Colors.black,
            text.style?.color ?? Colors.black,
            outerColor,
            outerColor,
          ],
          stops: [
            0.0,
            radiusCutoff,
            radiusCutoff,
            1.0,
          ],
        ).createShader(bounds);
      },
      child: text,
    );
  }
}
