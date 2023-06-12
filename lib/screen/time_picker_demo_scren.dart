import 'package:flutter/material.dart';

class TimePickerScren extends StatefulWidget {
  const TimePickerScren({Key? key}) : super(key: key);

  @override
  State<TimePickerScren> createState() => _TimePickerScrenState();
}

class _TimePickerScrenState extends State<TimePickerScren> {

  Map<String, TimeOfDay> workingTimes = {
    'Monday': TimeOfDay.now(),
    'Tuesday': TimeOfDay.now(),
    'Wednesday': TimeOfDay.now(),
    'Thursday': TimeOfDay.now(),
    'Friday': TimeOfDay.now(),
    'Saturday': TimeOfDay.now(),
    'Sunday': TimeOfDay.now(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Day Details'),
      ),
      body: ListView(
        children: [
          for (String day in workingTimes.keys)
            ListTile(
              title: Text(day),
              subtitle: Text(
                  'Working Time: ${workingTimes[day]!.hour}:${workingTimes[day]!.minute.toString().padLeft(2, '0')}'),
              onTap: () => _selectTime(context, day),
            ),
        ],
      ),
    );
  }
  void _selectTime(BuildContext context, String day) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: workingTimes[day]!,
    );
    if (picked != null && picked != workingTimes[day]) {
      setState(() {
        workingTimes[day] = picked;
      });
    }
  }

}
