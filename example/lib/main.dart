import 'package:dual_tone_text_codespark/dual_tone_text_codespark.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DualToneText(
                text: const Text(
                  'WELCOME',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                bottomColor: Colors.orange,
                splitPercentage: 0.5,
              ),
              const SizedBox(height: 40),
              RadialSplitText(
                text: const Text(
                  'WELCOME',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                outerColor: Colors.red,
                radiusCutoff: 0.4,
              ),
              DualToneTextByChar(
                text: "Hello World",

                style: TextStyle(fontSize: 24),
                topColor: Colors.red,
                bottomColor: Colors.blue,
                splitAt: 8,
              ),

              DualToneCheckerboardText(
                text: "Checkerboard",
                style: TextStyle(fontSize: 24),
                color1: Colors.green,
                color2: Colors.orange,
              ),

              DualToneWordSplitText(
                text: "Split Per Word",
                style: TextStyle(fontSize: 24),
                color1: Colors.purple,
                color2: Colors.teal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
