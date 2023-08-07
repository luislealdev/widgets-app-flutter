import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final themeProvider = StateProvider((ref) => false);

final colorListProvider = Provider((ref) => colors);

final selectedColorProvider = StateProvider((ref) => 0);
