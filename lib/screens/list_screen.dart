import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/project.dart';
import '../widgets/project_card.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'Tous';

  @override
  Widget build(BuildContext context) {
    final categories = ['Tous', 'Web', 'Mobile'];

    final filteredProjects = mockProjects.where((p) {
      final matchesSearch = p.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.description.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == 'Tous' || p.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();

    // Détection si l'écran est large (Tablette / PC)
    final isTabletOrDesktop = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projets'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Ajouter un projet',
            onPressed: () => context.go('/add-project'),
          )
        ],
      ),
      body: Column(
        children: [
          // Barre de recherche
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher un projet...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (val) => setState(() => _searchQuery = val),
            ),
          ),
          
          // Filtres de catégories
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                final isSelected = _selectedCategory == cat;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    label: Text(cat),
                    selected: isSelected,
                    onSelected: (_) => setState(() => _selectedCategory = cat),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),

          // Liste ou Grille de cartes
          Expanded(
            child: filteredProjects.isEmpty
                ? const Center(child: Text('Aucun projet trouvé.'))
                : isTabletOrDesktop
                    ? GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.45, // Ratio ajusté pour des cartes compactes sur PC
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: filteredProjects.length,
                        itemBuilder: (ctx, i) => ProjectCard(
                          project: filteredProjects[i],
                          onTap: () => context.go('/projects/${filteredProjects[i].id}'),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: filteredProjects.length,
                        itemBuilder: (ctx, i) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ProjectCard(
                            project: filteredProjects[i],
                            onTap: () => context.go('/projects/${filteredProjects[i].id}'),
                          ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}