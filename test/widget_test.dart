import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/main.dart';

void main() {
  testWidgets('Test de navigation et d\'affichage de l\'écran d\'accueil', (WidgetTester tester) async {
    await tester.pumpWidget(const DevHubApp());

    // Vérifie la présence du titre d'accueil
    expect(find.text('Bienvenue sur DevHub'), findsOneWidget);
    expect(find.text('Explorer les Projets'), findsOneWidget);

    // Clique sur le bouton d'exploration
    await tester.tap(find.text('Explorer les Projets'));
    await tester.pumpAndSettle();

    // Vérifie qu'on est sur l'écran de liste
    expect(find.text('Projets Open Source'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
}