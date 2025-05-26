import 'package:dual_tone_text_codespark/dual_tone_text_codespark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DualToneText builds correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DualToneText(
            text: Text(
              'Hello',
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
            bottomColor: Colors.red,
            splitPercentage: 0.5,
            direction: DualToneDirection.vertical,
          ),
        ),
      ),
    );

    expect(find.text('Hello'), findsOneWidget);
  });

  testWidgets('RadialSplitText builds correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RadialSplitText(
            text: Text(
              'Welcome',
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
            outerColor: Colors.orange,
            radiusCutoff: 0.4,
          ),
        ),
      ),
    );

    expect(find.text('Welcome'), findsOneWidget);
  });
}
