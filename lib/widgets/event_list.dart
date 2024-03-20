import 'package:flutter/material.dart';
import 'package:mc_project2/main.dart';
import 'package:mc_project2/models/event.dart';
import 'package:mc_project2/widgets/event_item.dart';

class EventList extends StatelessWidget {
  const EventList({
    Key? key,
    required this.events,
    required this.category,
    required this.onRemoveEvent,
    required this.onUpdate,
  }) : super(key: key);

  final List<Event> events;
  final String category;
  final void Function(Event event) onRemoveEvent;
  final void Function(Event event) onUpdate;

  String categoryName(String category) {
    return category[0].toUpperCase() + category.substring(1) + 's';
  }

  @override
  Widget build(BuildContext context) {
    final catUp = categoryName(category);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Text(
                catUp,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: kPurple, fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Divider(color: kPurple),
              ),
            ],
          ),
        ),
        if (events.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final event in events)
                EventItem(
                  event: event,
                  onRemoveEvent: onRemoveEvent,
                  onUpdate: onUpdate,
                ),
            ],
          )
        else
          const Center(
            child: Text(
              'Category empty, Start adding some !',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        SizedBox(height: 10),
      ],
    );
  }
}
