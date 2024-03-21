import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_project2/main.dart';
import 'package:mc_project2/models/event.dart';
import 'package:mc_project2/screens/form.dart';

class EventItem extends StatefulWidget {
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
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: kPurple,
        value: widget.event.isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value!;
            widget.event.isChecked = isChecked;
          });
        },
      ),
      title: Text(
        widget.event.name,
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
                        eventToEdit: widget.event,
                        onSubmittEvent: (event) => widget.onUpdate(event),
                      )));
            },
            icon: Icon(
              Icons.edit,
              color: kPurple,
            ),
          ),
          IconButton(
            onPressed: () {
              widget.onRemoveEvent(widget.event);
            },
            icon: Icon(CupertinoIcons.minus_circle, color: kErreur),
          ),
        ],
      ),
    );
  }
}
