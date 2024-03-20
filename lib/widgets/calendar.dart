import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:mc_project2/main.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    super.key,
    required this.selectedDate,
  });

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.single,
            selectedDayHighlightColor: kPurple,
            selectedRangeHighlightColor: kPurple,
            weekdayLabelTextStyle:
                TextStyle(color: kPurple, fontWeight: FontWeight.bold)),
        value: [selectedDate],
      ),
    );
  }
}