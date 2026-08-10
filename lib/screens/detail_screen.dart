import 'package:flutter/material.dart';
import '../models/project.dart';
import '../widgets/tag_chip.dart';

class DetailScreen extends StatelessWidget {
  final String projectId;

  const DetailScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    final project = mockProjects.firstWhere(
      (p) => p.id == projectId,
      orElse: () => const Project(
        id: '0',
        title: 'Introuvable',
        description: '',
        category: '',
        tags: [],
        stars: 0,
        imageUrl: '',
      ),
    );

    if (project.id == '0') {
      return Scaffold(
        appBar: AppBar(title: const Text('Erreur')),
        body: const Center(child: Text('Projet introuvable.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              project.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(label: Text(project.category)),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text('${project.stars} étoiles'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    project.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(project.description, style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 20),
                  const Text('Technologies :', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: project.tags.map((t) => TagChip(label: t)).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}