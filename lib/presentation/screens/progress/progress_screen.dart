import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Indicators"),
      ),
      body: const _IndicatorsView(),
    );
  }
}

class _IndicatorsView extends StatelessWidget {
  const _IndicatorsView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text("Infinite Progress Indicator"),
          CircularProgressIndicator(
            color: Colors.black,
            backgroundColor: Colors.black26,
          ),
          SizedBox(height: 15),
          Text("Stream progress inficators"),
          _StreamProgressIndicators()
        ],
      ),
    );
  }
}

class _StreamProgressIndicators extends StatelessWidget {
  const _StreamProgressIndicators();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;
          
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(value: progressValue),
                const SizedBox(width: 20),
                Expanded(
                    child: LinearProgressIndicator(
                  value: progressValue,
                ))
              ],
            ),
          );
        });
  }
}
