import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { event, bootcamp, work, competition }

final formatter = DateFormat.yMd();

class Event {
  Event({
    required this.name,
    required this.description,
    required this.start,
    required this.end,
    required this.category,
    this.isChecked = false,
  }) : id = uuid.v4();

  final String id;
  final String name;
  final String description;
  final DateTime start;
  final DateTime end;
  final Category category;
  bool isChecked;
}