import 'package:flutter/material.dart';

class TextGradient extends StatefulWidget {
  const TextGradient({super.key});

  @override
  State<TextGradient> createState() => _TextGradientState();
}

class _TextGradientState extends State<TextGradient> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Text Gradient Example'),
        ),
        body: Center(
          child: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF8165B6), Color(0xFF9F21F3), Color(0xFF362E57)],
              ).createShader(bounds);
            },
            child: const  Text(
              'Gradient Text',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),

    );
  }
}
