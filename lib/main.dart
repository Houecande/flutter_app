import 'package:flutter/material.dart';
import 'repository/project_repository.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const DevHubApp());
}

class DevHubApp extends StatefulWidget {
  const DevHubApp({super.key});

  @override
  State<DevHubApp> createState() => _DevHubAppState();
}

class _DevHubAppState extends State<DevHubApp> {
  ThemeMode _themeMode = ThemeMode.system;
  final ProjectRepository _repository = ProjectRepository();

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = createRouter(_toggleTheme, _repository);

    return MaterialApp.router(
      title: 'DevHub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      routerConfig: router,
    );
  }
}