import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bool isDarkMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(themeProvider.notifier).update((state) => !state);
              },
              icon: Icon(isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined))
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return RadioListTile(
              subtitle: Text('${color.value}'),
              title: Text(
                "Este color",
                style: TextStyle(color: color),
              ),
              value: index,
              groupValue: selectedColor,
              activeColor: color,
              onChanged: (value) {
                ref
                    .read(selectedColorProvider.notifier)
                    .update((state) => index);
              });
        });
  }
}
