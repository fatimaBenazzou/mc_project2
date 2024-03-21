import 'package:mc_project2/models/event.dart';

List<Event> dummyEvents = [
  Event(
    name: 'Réunion mensuelle',
    description: 'Réunion mensuelle de l\'équipe de projet.',
    start: DateTime(2024, 3, 20, 10, 0),
    end: DateTime(2024, 3, 20, 12, 0),
    category: Category.event,
  ),
  Event(
    name: 'Bootcamp Flutter',
    description: 'Formation intensive sur Flutter.',
    start: DateTime(2024, 4, 5, 9, 0),
    end: DateTime(2024, 4, 10, 17, 0),
    category: Category.bootcamp,
  ),
  Event(
    name: 'Présentation client',
    description: 'Présentation du nouveau produit au client.',
    start: DateTime(2024, 3, 25, 14, 0),
    end: DateTime(2024, 3, 25, 16, 0),
    category: Category.work,
  ),
  Event(
    name: 'Hackathon',
    description: 'Hackathon de développement de logiciels.',
    start: DateTime(2024, 4, 15, 8, 0),
    end: DateTime(2024, 4, 16, 20, 0),
    category: Category.competition,
  ),
  Event(
    name: 'Réunion d\'équipe',
    description: 'Réunion d\'équipe hebdomadaire.',
    start: DateTime(2024, 3, 22, 9, 0),
    end: DateTime(2024, 3, 22, 11, 0),
    category: Category.event,
    isChecked: true,
  ),
];
