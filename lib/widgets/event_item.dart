import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_project2/main.dart';
import 'package:mc_project2/models/event.dart';
import 'package:mc_project2/screens/form.dart';

class EventItem extends StatelessWidget {
  const EventItem(
      {Key? key,
      required this.event,
      required this.onRemoveEvent,
      required this.onUpdate})
      : super(key: key);

  final Event event;
  final void Function(Event event) onUpdate;
  final void Function(Event event) onRemoveEvent;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: event.isDone,
        onChanged: (value) {},
      ),
      title: Text(
        event.name,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FormScreen(
                        eventToEdit: event,
                        onSubmittEvent: (event) => onUpdate(event),
                      )));
            },
            icon: Icon(
              Icons.edit,
              color: kPurple,
            ),
          ),
          IconButton(
            onPressed: () {
              onRemoveEvent(event);
            },
            icon: Icon(CupertinoIcons.minus_circle, color: kErreur),
          ),
        ],
      ),
    );
  }
}
