import 'package:flutter/material.dart';

import 'core_widgets_demo.dart';
import 'ex2.dart';
import 'ex3.dart';
import 'ex4.dart';
import 'ex5.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4 - Flutter UI Exercises',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: MainHomeScreen(
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}

class MainHomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const MainHomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> exercises = [
      {
        'title': 'Bài 1: Core Widgets',
        'subtitle': 'Text, Icon, Image, Card & ListTile',
        'icon': Icons.widgets,
        'color': Colors.blue,
        'widget': const CoreWidgetsDemo(),
      },
      {
        'title': 'Bài 2: Input Controls',
        'subtitle': 'Slider, Switch, RadioListTile & DatePicker',
        'icon': Icons.tune,
        'color': Colors.green,
        'widget': const InputControlsDemo(),
      },
      {
        'title': 'Bài 3: Layout Demo',
        'subtitle': 'Padding, Column, SizedBox & Expanded ListView',
        'icon': Icons.view_quilt,
        'color': Colors.orange,
        'widget': const LayoutDemo(),
      },
      {
        'title': 'Bài 4: App Structure & Theme',
        'subtitle': 'Scaffold, AppBar, FAB & Dark/Light Theme Switcher',
        'icon': Icons.style,
        'color': Colors.purple,
        'widget': Exercise4Screen(
          isDarkMode: isDarkMode,
          onThemeChanged: onThemeChanged,
        ),
      },
      {
        'title': 'Bài 5: Common UI Fixes',
        'subtitle': 'Fix Expanded, Horizontal Scroll, setState & DatePicker Context',
        'icon': Icons.bug_report,
        'color': Colors.deepOrange,
        'widget': const CommonUIFixesDemo(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 - Main Hub'),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
              Switch(
                value: isDarkMode,
                onChanged: onThemeChanged,
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final item = exercises[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12.0),
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: (item['color'] as Color).withValues(alpha: 0.15),
                child: Icon(
                  item['icon'] as IconData,
                  color: item['color'] as Color,
                ),
              ),
              title: Text(
                item['title'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(item['subtitle'] as String),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => item['widget'] as Widget,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

