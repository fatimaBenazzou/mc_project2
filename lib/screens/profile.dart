import 'package:flutter/material.dart';
import 'package:mc_project2/data/dummy_event.dart';
import 'package:mc_project2/main.dart';
import 'package:mc_project2/models/event.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isChecked = false;

  final List<Event> completedEvents =
      dummyEvents.where((event) => event.isChecked).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(clipBehavior: Clip.none,
              children: [
                Container(
                  height: 223,
                  decoration: BoxDecoration(
                      gradient: kGradient,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20))),
                ),
                Positioned(
                    left: MediaQuery.of(context).size.width * 0.35,
                    top: 162,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          height: 120,
                          width: 120,
                          padding: const EdgeInsets.all(8),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              'assets/images/bird.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      Text('Fatima Benazzou', style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),),
              ],
            ),
            SizedBox(height: 120),
            Text(
              'Completed Events',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: kPurple, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            (completedEvents.isNotEmpty)
                ? Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (final event in completedEvents)
                        ListTile(
                          leading: Checkbox(
                            activeColor: kPurple,
                            value: event.isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                                event.isChecked = isChecked;
                              });
                            },
                          ),
                          title: Text(
                            event.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                    ],
                  )
                : const Center(
                    child: Text(
                      'No Events Completed for the moment!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
