import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../repository/project_repository.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/tag_chip.dart';

class DetailScreen extends StatelessWidget {
  final String projectId;
  final ProjectRepository repository;

  const DetailScreen({
    super.key,
    required this.projectId,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    final project = repository.getProjectById(projectId);

    if (project == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Erreur')),
        body: const EmptyStateWidget(
          message: AppStrings.projectNotFound,
          icon: Icons.error_outline,
        ),
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
              errorBuilder: (_, _, _) => Container(
                height: 250,
                color: Colors.grey.shade800,
                child: const Icon(Icons.code, size: 80),
              ),
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
                  Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Technologies :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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