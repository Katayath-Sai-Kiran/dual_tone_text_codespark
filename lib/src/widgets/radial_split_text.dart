import 'package:flutter/material.dart';

/// A widget that displays [Text] with a sharp radial dual-tone split.
///
/// The effect creates a solid circle at the center of the text filled with the original text color,
/// while the area outside the circle is filled with a user-defined [outerColor].
///
/// Useful for creative headings, banners, or stylistic emphasis.
class RadialSplitText extends StatelessWidget {
  /// The text to be rendered.
  final Text text;

  /// The color outside the radial split.
  final Color outerColor;

  /// The normalized (0.0 - 1.0) cutoff radius where the text color ends and the [outerColor] begins.
  ///
  /// This value controls how much of the center is preserved in the original text color.
  final double radiusCutoff;

  /// The line height (text style `height`) applied to the text.
  ///
  /// A value of 0.78 is chosen as a default because it provides a visually compact and balanced
  /// text layout when used with `ShaderMask`. This ensures consistent alignment across platforms.
  final double textHeight;

  /// Creates a radial split text effect.
  ///
  /// [text] is required and is the main content to display.
  /// [outerColor] is used to color the area outside the center split.
  /// [radiusCutoff] controls where the split happens; default is 0.5.
  /// [textHeight] defaults to 0.78 for better text compactness in masked rendering.
  const RadialSplitText({
    super.key,
    required this.text,
    required this.outerColor,
    this.radiusCutoff = 0.5,
    this.textHeight = 0.78,
  });

  @override
  Widget build(BuildContext context) {
    // Returns a copy of the Text widget with modified line height
    Text adjustedText = _getAdjustedText();

    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        // Creates a radial gradient with a solid center and solid outer ring.
        return RadialGradient(
          center: Alignment.center,
          radius: 3.0, // Increased radius to ensure complete coverage
          colors: [
            text.style?.color ?? Colors.black,
            text.style?.color ?? Colors.black,
            outerColor,
            outerColor,
          ],
          stops: [0.0, radiusCutoff, radiusCutoff, 1.0],
        ).createShader(bounds);
      },
      child: adjustedText,
    );
  }

  /// Returns a new [Text] widget with the adjusted line height.
  ///
  /// This ensures that the text renders correctly within the bounds of the gradient mask.
  /// Other text properties are retained from the original [text].
  Text _getAdjustedText() {
    final TextStyle adjustedStyle = (text.style ?? const TextStyle()).copyWith(
      height: textHeight,
    );

    return Text(
      text.data ?? '',
      key: text.key,
      style: adjustedStyle,
      textAlign: text.textAlign,
      textDirection: text.textDirection,
      locale: text.locale,
      maxLines: text.maxLines,
      overflow: text.overflow,
      softWrap: text.softWrap,
      strutStyle: text.strutStyle,
      textHeightBehavior: text.textHeightBehavior,
      textScaler: text.textScaler,
      semanticsLabel: text.semanticsLabel,
      textWidthBasis: text.textWidthBasis,
    );
  }
}
