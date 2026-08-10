class Project {
  final String id;
  final String title;
  final String description;
  final String category;
  final List<String> tags;
  final int stars;
  final String imageUrl;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.tags,
    required this.stars,
    required this.imageUrl,
  });
}

final List<Project> mockProjects = [
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