import 'package:darkmode_lightmode_switcher/lightmode_darkmode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switcher'),
        actions: [
          Switch(
            value: themeProvider.currentThemeMode == ThemeMode.dark,
            onChanged: (value) {
              // Call the switchThemeMode method with the desired theme mode value
              value
                  ? themeProvider.switchThemeMode(ThemeMode.dark)
                  : themeProvider.switchThemeMode(ThemeMode.light);
            },
          ),
        ],
      ),
    );
  }
}
