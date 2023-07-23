import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 200;
  double height = 200;
  Color color = Colors.blue;
  double borderRadius = 20;

  void changeShape() {
    final random = Random();
    width = random.nextDouble() * 300 + 50;
    height = random.nextDouble() * 300 + 50;
    borderRadius = random.nextDouble() * 60;
    color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated")),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow),
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.elasticInOut,
          duration: const Duration(milliseconds: 400),
          height: height <= 0 ? 0 : height,
          width: width <= 0 ? 0 : width,
          decoration: BoxDecoration(
              color: color,
              borderRadius:
                  BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius)),
        ),
      ),
    );
  }
}
