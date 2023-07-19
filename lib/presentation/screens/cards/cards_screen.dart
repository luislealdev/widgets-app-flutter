import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0.0'},
  {'elevation': 1.0, 'label': 'Elevation 1.0'},
  {'elevation': 2.0, 'label': 'Elevation 2.0'},
  {'elevation': 3.0, 'label': 'Elevation 3.0'},
  {'elevation': 4.0, 'label': 'Elevation 4.0'},
  {'elevation': 5.0, 'label': 'Elevation 5.0'},
];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards screen"),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        ...cards.map((card) =>
            CustomCard(elevation: card['elevation'], label: card['label'])),
        ...cards.map((card) => _BorderCustomCard(
            elevation: card['elevation'], label: card['label'])),
        ...cards.map((card) => _FilledBorderCustomCard(
            elevation: card['elevation'], label: card['label'])),
        ...cards.map((card) => _BorderImageCustomCard(
            elevation: card['elevation'], label: card['label']))
      ],
    ));
  }
}

class CustomCard extends StatelessWidget {
  final double elevation;
  final String label;

  const CustomCard({
    super.key,
    required this.elevation,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(label),
          )
        ]),
      ),
    );
  }
}

class _BorderCustomCard extends StatelessWidget {
  final double elevation;
  final String label;

  const _BorderCustomCard({
    required this.elevation,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: colors.outline),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('$label - circular'),
          )
        ]),
      ),
    );
  }
}

class _FilledBorderCustomCard extends StatelessWidget {
  final double elevation;
  final String label;

  const _FilledBorderCustomCard({
    required this.elevation,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: colors.outline),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('$label - filled circular'),
          )
        ]),
      ),
    );
  }
}

class _BorderImageCustomCard extends StatelessWidget {
  final double elevation;
  final String label;

  const _BorderImageCustomCard({
    required this.elevation,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.hardEdge,
      color: colors.surfaceVariant,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: colors.outline),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      elevation: elevation,
      child: Stack(children: [
        Image.network(
          "https://picsum.photos/id/${elevation.toInt()}/600/350",
          height: 350,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(20))),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
          ),
        ),
      ]),
    );
  }
}
