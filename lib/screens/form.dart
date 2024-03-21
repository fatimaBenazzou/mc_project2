import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mc_project2/main.dart';
import 'package:mc_project2/models/event.dart';
import 'package:mc_project2/widgets/text_field.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({
    Key? key,
    required this.onSubmittEvent,
    this.eventToEdit,
  }) : super(key: key);

  final Event? eventToEdit;
  final void Function(Event event) onSubmittEvent;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  Category selectedCategory = Category.event;

  @override
  void initState() {
    super.initState();
    if (widget.eventToEdit != null) {
      _populateFields();
    }
  }

  void _populateFields() {
    final event = widget.eventToEdit!;
    nameController.text = event.name;
    descriptionController.text = event.description;
    startDate = event.start;
    endDate = event.end;
    selectedCategory = event.category;
  }

  void _presentStartDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null) {
      setState(() {
        startDate = pickedDate;
      });
    }
  }

  void _presentEndDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: startDate ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null) {
      setState(() {
        endDate = pickedDate;
      });
    }
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Invalid input'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }

  void _submitEventData() {
    if (nameController.text.trim().isEmpty ||
        descriptionController.text.trim().isEmpty ||
        startDate == null ||
        endDate == null) {
      _showDialog(
        'Please make sure a valid Name, Description, start/end date, and category are entered.',
      );
      return;
    }

    final event = Event(
      name: nameController.text,
      description: descriptionController.text,
      start: startDate!,
      end: endDate!,
      category: selectedCategory,
    );

    widget.onSubmittEvent(event);
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textfield(label: 'Name', controller: nameController),
                  const SizedBox(height: 20),
                  textfield(
                      label: 'Description', controller: descriptionController),
                  const SizedBox(height: 20),
                  const Text('Category',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  categoryDropDown(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      dateSelection(
                        label: 'From:',
                        date: endDate,
                        onTap: _presentEndDatePicker,
                      ),
                      dateSelection(
                        label: 'To:',
                        date: startDate,
                        onTap: _presentStartDatePicker,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton.icon(
              icon: Icon(widget.eventToEdit == null ? Icons.add : Icons.check,
                  color: Colors.white),
              style: ElevatedButton.styleFrom(
                backgroundColor: kPurple,
              ),
              onPressed: _submitEventData,
              label: Text(
                widget.eventToEdit == null ? 'Add' : 'Edit',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryDropDown() {
    return DropdownButton<Category>(
      // dropdownColor: kPurple.withOpacity(0.2),
      padding: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(16),
      iconEnabledColor: kPurple,
      style: TextStyle(color: kPurple),
      value: selectedCategory,
      onChanged: (value) {
        setState(() {
          selectedCategory = value!;
        });
      },
      items: Category.values.map((category) {
        return DropdownMenuItem<Category>(
          value: category,
          child: Text(category.name),
        );
      }).toList(),
    );
  }

  Widget dateSelection({
    required String label,
    required DateTime? date,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(width: 20),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: BoxDecoration(
              color: kPurple.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            width: MediaQuery.of(context).size.width * 0.35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    date == null
                        ? 'Select Date'
                        : '${date.day}/${date.month}/${date.year}',
                    style: TextStyle(color: kPurple)),
                Icon(
                  CupertinoIcons.calendar,
                  color: kPurple,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
