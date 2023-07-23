import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text("Hello world"),
      action: SnackBarAction(label: "Ok!", onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Are you sure?"),
              content: const Text("This action can not be undo"),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text("Cancel")),
                FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text("Confirm"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Snackbars")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text("Aquí vendría descripción de la app")
                  ]);
                },
                child: const Text("Open licences")),
            FilledButton.tonal(
                onPressed: () {
                  openDialog(context);
                },
                child: const Text("Show dialog")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text("Open snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
