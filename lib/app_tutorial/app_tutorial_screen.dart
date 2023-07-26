import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Slide {
  final String title;
  final String caption;
  final String imageUrl;

  Slide(this.title, this.caption, this.imageUrl);
}

final slides = <Slide>[
  Slide(
      "Order your food",
      "Est velit tempor dolor fugiat commodo deserunt eu dolor aute voluptate.",
      "assets/images/1.png"),
  Slide(
      "Delivery in 15 minutes",
      "Est velit tempor dolor fugiat commodo deserunt eu dolor aute voluptate.",
      "assets/images/2.png"),
  Slide(
      "Enjoy!",
      "Est velit tempor dolor fugiat commodo deserunt eu dolor aute voluptate.",
      "assets/images/3.png"),
];

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      slideData.title, slideData.caption, slideData.imageUrl))
                  .toList(),
            ),
            !endReached
                ? Positioned(
                    right: 20,
                    top: 50,
                    child: TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text("Skip"),
                    ))
                : Positioned(
                    right: 50,
                    bottom: 50,
                    child: FadeInRight(
                      duration: const Duration(seconds: 1),
                      child: FilledButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: const Text("Start"),
                      ),
                    ))
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(this.title, this.caption, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl),
          const SizedBox(height: 20),
          Text(
            title,
            style: titleStyle,
          ),
          Text(caption, style: captionStyle)
        ],
      ),
    );
  }
}
