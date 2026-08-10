import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;

  const HomeScreen({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DevHub'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.developer_mode, size: 80, color: Colors.indigo),
              const SizedBox(height: 16),
              Text(
                'Bienvenue sur DevHub',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Découvrez et publiez des projets open-source exceptionnels.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              CustomButton(
                label: 'Explorer les Projets',
                icon: Icons.explore,
                onPressed: () => context.go('/projects'),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () => context.go('/add-project'),
                icon: const Icon(Icons.add),
                label: const Text('Ajouter un Projet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}