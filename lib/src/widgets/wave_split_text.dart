import 'dart:math';
import 'package:flutter/material.dart';

/// A widget that renders text with a wave-shaped horizontal split
/// between two colors (topColor and bottomColor).
/// The split line follows a sinusoidal curve controlled by
/// [amplitude] and [frequency].
class WaveSplitText extends StatelessWidget {
  /// The text string to render.
  final String text;

  /// The style applied to the text.
  final TextStyle style;

  /// The color used for the top portion of the text.
  final Color topColor;

  /// The color used for the bottom portion of the text.
  final Color bottomColor;

  /// The height of the wave peaks in logical pixels.
  final double amplitude;

  /// The number of wave cycles across the text width.
  final double frequency;

  /// Creates a wave split text widget.
  ///
  /// [amplitude] defaults to 6.0 logical pixels,
  /// and [frequency] defaults to 1.5 cycles.
  const WaveSplitText({
    super.key,
    required this.text,
    required this.style,
    required this.topColor,
    required this.bottomColor,
    this.amplitude = 6.0,
    this.frequency = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _WaveSplitTextPainter(
        text: text,
        style: style,
        topColor: topColor,
        bottomColor: bottomColor,
        amplitude: amplitude,
        frequency: frequency,
      ),
    );
  }
}

/// A [CustomPainter] that paints text with a sinusoidal wave split
/// between [topColor] and [bottomColor].
class _WaveSplitTextPainter extends CustomPainter {
  final String text;
  final TextStyle style;
  final Color topColor;
  final Color bottomColor;
  final double amplitude;
  final double frequency;

  _WaveSplitTextPainter({
    required this.text,
    required this.style,
    required this.topColor,
    required this.bottomColor,
    required this.amplitude,
    required this.frequency,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Prepare TextPainter for measuring and layout
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();

    // Get width and height of the rendered text
    final textWidth = textPainter.width;
    final textHeight = textPainter.height;

    // Calculate offsets to center the text within the available canvas
    final dx = (size.width - textWidth) / 2;
    final dy = (size.height - textHeight) / 2;
    final offset = Offset(dx, dy);

    // Construct the wavy split path along the horizontal axis
    final wavePath = Path();
    // Middle vertical position of the text
    final midY = dy + textHeight / 2;

    // Build sinusoidal wave from left (0) to right (textWidth)
    for (double x = 0; x <= textWidth; x++) {
      // Calculate y coordinate of wave using sine function
      final y = midY + amplitude * sin(2 * pi * frequency * x / textWidth);
      if (x == 0) {
        wavePath.moveTo(dx + x, y);
      } else {
        wavePath.lineTo(dx + x, y);
      }
    }

    // Close the path by connecting wave end points back to top corners
    wavePath.lineTo(dx + textWidth, dy);
    wavePath.lineTo(dx, dy);
    wavePath.close();

    // Paint top half clipped by the wave path
    canvas.save();
    canvas.clipPath(wavePath);
    final topPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style.copyWith(color: topColor),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    topPainter.paint(canvas, offset);
    canvas.restore();

    // Paint bottom half clipped by the inverse of wave path
    final fullRect = Path()
      ..addRect(Rect.fromLTWH(dx, dy, textWidth, textHeight));
    final bottomPath = Path.combine(
      PathOperation.difference,
      fullRect,
      wavePath,
    );

    canvas.save();
    canvas.clipPath(bottomPath);
    final bottomPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style.copyWith(color: bottomColor),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    bottomPainter.paint(canvas, offset);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _WaveSplitTextPainter oldDelegate) {
    // Repaint if any relevant properties have changed
    return text != oldDelegate.text ||
        style != oldDelegate.style ||
        topColor != oldDelegate.topColor ||
        bottomColor != oldDelegate.bottomColor ||
        amplitude != oldDelegate.amplitude ||
        frequency != oldDelegate.frequency;
  }
}
