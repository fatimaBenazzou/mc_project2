import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mc_project2/data/dummy_event.dart';
import 'package:mc_project2/main.dart';
import 'package:mc_project2/models/event.dart';
import 'package:mc_project2/screens/form.dart';
import 'package:mc_project2/screens/profile.dart';
import 'package:mc_project2/widgets/calendar.dart';
import 'package:mc_project2/widgets/event_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime currentDate = DateTime.now();

  void addEvent(Event event) {
    setState(() {
      dummyEvents.add(event);
      openDialog(event, context, 'add');
    });
  }

  void editEvent(Event event) {
    setState(() {
      openDialog(event, context, 'update');
      Navigator.pop(context);
    });
  }

  void openDialog(Event event, BuildContext context, String action) {
    String message;
    String buttonText;

    switch (action) {
      case 'delete':
        message = 'Are you sure you want to delete this event?';
        buttonText = 'No';
        break;
      case 'update':
        message = 'Update successful';
        buttonText = 'Done';
        break;
      case 'add':
        message = 'Add successful';
        buttonText = 'Done';
        break;
      default:
        throw ArgumentError('Invalid action: $action');
    }

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/bird.png',
              height: 125,
              width: 170,
            ),
            const SizedBox(height: 10),
            Text(
              message,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              action == 'delete'
                  ? ElevatedButton(
                      onPressed: () {
                        setState(() {
                          dummyEvents.remove(event);
                        });
                        Navigator.pop(ctx);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPurple,
                        fixedSize: const Size(100, 36),
                      ),
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.alphaBlend(kPurple.withOpacity(0.7), Colors.black),
                  fixedSize: const Size(100, 36),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            icon: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset('assets/images/bird.png'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPurple,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FormScreen(
                onSubmittEvent: ((event) => addEvent(event)),
              ),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Stack(
            children: [Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('MMMM yyyy').format(currentDate),
                  style: TextStyle(fontWeight: FontWeight.bold, color: kPurple),
                ),
                Text(
                  DateFormat('d, EE').format(currentDate),
                  style: TextStyle(
                      fontSize: 42, fontWeight: FontWeight.bold, color: kPurple),
                ),
                Divider(
                  color: kPurple,
                  thickness: 2,
                ),
                SizedBox(height: 20),
                Calendar(selectedDate: selectedDate),
                SizedBox(height: 20),
                for (final category in Category.values)
                  eventList(context, category),
              ],
            ),
              Positioned( right: 0, top: 13,child: Image.asset('assets/images/bird.png',height: 85, width: 110,)),
            
            ]
          ),
        ),
      ),
    );
  }

  Widget eventList(BuildContext context, Category category) {
    final eventsCategory =
        dummyEvents.where((event) => event.category == category).toList();
    return EventList(
      events: eventsCategory,
      category: category.name,
      onRemoveEvent: (event) => openDialog(event, context, 'delete'),
      onUpdate: (event) => editEvent(event),
    );
  }
}
