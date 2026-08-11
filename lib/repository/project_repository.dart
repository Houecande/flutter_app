import '../models/project.dart';

class ProjectRepository {
  final List<Project> _projects = [
    const Project(
      id: '1',
      title: 'Aurum Hotel',
      description: 'Système complet de réservation d\'hôtel avec gestion de base de données.',
      category: 'Web',
      tags: ['Flutter', 'MySQL', 'PHP'],
      stars: 124,
      imageUrl: 'https://picsum.photos/seed/aurum/600/400',
    ),
    const Project(
      id: '2',
      title: 'Lokatoo',
      description: 'Plateforme moderne de gestion immobilière et locative.',
      category: 'Mobile',
      tags: ['Flutter', 'VB.NET', 'API'],
      stars: 89,
      imageUrl: 'https://picsum.photos/seed/lokatoo/600/400',
    ),
    const Project(
      id: '3',
      title: 'Zestly Quiz',
      description: 'Application de jeu questionnaire dynamique avec effets sonores.',
      category: 'Mobile',
      tags: ['Flutter', 'Dart', 'Audio'],
      stars: 210,
      imageUrl: 'https://picsum.photos/seed/zestly/600/400',
    ),
    const Project(
      id: '4',
      title: 'Webtoon Play',
      description: 'Scraper Python et plateforme d\'affichage de webtoons.',
      category: 'Web',
      tags: ['Python', 'FastAPI', 'JavaScript'],
      stars: 305,
      imageUrl: 'https://picsum.photos/seed/webtoon/600/400',
    ),
  ];

  List<Project> getAllProjects() => List.unmodifiable(_projects);

  Project? getProjectById(String id) {
    try {
      return _projects.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  void addProject(Project project) {
    _projects.add(project);
  }

  List<Project> filterProjects({
    required String query,
    required String category,
    String sortBy = 'stars',
  }) {
    var result = _projects.where((p) {
      final matchesQuery = p.title.toLowerCase().contains(query.toLowerCase()) ||
          p.description.toLowerCase().contains(query.toLowerCase()) ||
          p.tags.any((tag) => tag.toLowerCase().contains(query.toLowerCase()));
      final matchesCategory = category == 'Tous' || p.category == category;
      return matchesQuery && matchesCategory;
    }).toList();

    if (sortBy == 'stars') {
      result.sort((a, b) => b.stars.compareTo(a.stars));
    } else if (sortBy == 'title') {
      result.sort((a, b) => a.title.compareTo(b.title));
    }

    return result;
  }
}