import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/list_screen.dart';
import '../screens/detail_screen.dart';
import '../screens/add_project_screen.dart';

GoRouter createRouter(VoidCallback onToggleTheme) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(onToggleTheme: onToggleTheme),
      ),
      GoRoute(
        path: '/projects',
        builder: (context, state) => const ListScreen(),
      ),
      GoRoute(
        path: '/projects/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return DetailScreen(projectId: id);
        },
      ),
      GoRoute(
        path: '/add-project',
        builder: (context, state) => const AddProjectScreen(),
      ),
    ],
  );
}