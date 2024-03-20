
import 'package:flutter/material.dart';
import 'package:mc_project2/main.dart';

class textfield extends StatelessWidget {
  const textfield({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter $label',
            hintStyle: TextStyle(color: kPurple),
            filled: true,
            fillColor: kPurple.withOpacity(0.2),
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}
