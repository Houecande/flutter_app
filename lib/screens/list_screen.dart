import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_strings.dart';
import '../repository/project_repository.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/project_card.dart';

class ListScreen extends StatefulWidget {
  final ProjectRepository repository;

  const ListScreen({super.key, required this.repository});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  String _searchQuery = '';
  String _selectedCategory = AppStrings.categoryAll;
  String _sortBy = 'stars'; // 'stars' ou 'title'

  @override
  Widget build(BuildContext context) {
    final categories = [AppStrings.categoryAll, 'Web', 'Mobile'];
    final filteredProjects = widget.repository.filterProjects(
      query: _searchQuery,
      category: _selectedCategory,
      sortBy: _sortBy,
    );

    final isTabletOrDesktop = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projets Open Source'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort),
            tooltip: 'Trier par',
            onSelected: (val) => setState(() => _sortBy = val),
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'stars', child: Text('Trier par Étoiles')),
              const PopupMenuItem(value: 'title', child: Text('Trier par Nom')),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: AppStrings.addProjectBtn,
            onPressed: () => context.go('/add-project'),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: AppStrings.searchHint,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (val) => setState(() => _searchQuery = val),
            ),
          ),
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
          Expanded(
            child: filteredProjects.isEmpty
                ? const EmptyStateWidget(message: AppStrings.noProjects)
                : isTabletOrDesktop
                    ? GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.45,
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