import 'package:mc_project2/models/event.dart';

List<Event> dummyEvents = [
  Event(
    name: 'Réunion d\'équipe',
    description: 'Présentation des progrès du projet',
    start: DateTime.now().subtract(const Duration(hours: 1)),
    end: DateTime.now().add(const Duration(hours: 2)),
    category: Category.work,
    isDone: false,
  ),
  Event(
      name: 'Entretien avec le client',
      description: 'Discussion sur les exigences du projet',
      start: DateTime.now().add(const Duration(days: 1)),
      end: DateTime.now().add(const Duration(days: 1, hours: 2)),
      isDone: false,
      category: Category.work),
  Event(
      name: 'Formation interne',
      description: 'Introduction à Flutter',
      start: DateTime.now().add(const Duration(days: 3)),
      end: DateTime.now().add(const Duration(days: 3, hours: 3)),
      isDone: false,
      category: Category.work),
  Event(
      name: 'Réunion de planification',
      description: 'Planification des tâches pour la semaine prochaine',
      start: DateTime.now().add(const Duration(days: 5)),
      end: DateTime.now().add(const Duration(days: 5, hours: 2)),
      isDone: false,
      category: Category.work),
  Event(
      name: 'Test de l\'application',
      description: 'Exécution des tests de régression',
      start: DateTime.now().add(const Duration(days: 7)),
      end: DateTime.now().add(const Duration(days: 7, hours: 4)),
      isDone: false,
      category: Category.work),
];
