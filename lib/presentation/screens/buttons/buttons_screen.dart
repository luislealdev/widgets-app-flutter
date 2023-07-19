import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons screen"),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FilledButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("Elevated"),
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.account_balance_wallet),
                label: const Text("Elevated icon")),
            FilledButton(onPressed: () {}, child: const Text("Filled")),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_box_rounded),
                label: const Text("Filled icon")),
            FilledButton.tonal(onPressed: () {}, child: const Text("Tonal")),
            OutlinedButton(onPressed: () {}, child: const Text("Outlined")),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_circle_outline_outlined),
                label: const Text("Outlined icon")),
            TextButton(onPressed: () {}, child: const Text("Text")),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_time),
                label: const Text("Text icon")),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.account_circle_sharp)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle_sharp),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: const MaterialStatePropertyAll(Colors.white)),
            ),
            const CustomButton()
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Custom button",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
