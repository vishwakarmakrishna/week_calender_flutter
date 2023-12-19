import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Calendar { day, week }

class _HomePageState extends State<HomePage> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          calendarView == Calendar.day ? 'In App Calendar' : 'My Calendar',
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        actions: [
          SegmentedButton<Calendar>(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.zero,
              ),
              side: MaterialStateProperty.all<BorderSide>(
                const BorderSide(
                  color: Colors.blue,
                ),
              ),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return Theme.of(context).colorScheme.primary;
                  }
                  return Theme.of(context).colorScheme.surface;
                },
              ),
            ),
            segments: Calendar.values.map<ButtonSegment<Calendar>>(
              (Calendar calendar) {
                return ButtonSegment<Calendar>(
                  value: calendar,
                  label: Text(
                    calendar.name.toUpperCase(),
                    style: TextStyle(
                        color: calendar == calendarView
                            ? Colors.white
                            : Colors.blue),
                  ),
                );
              },
            ).toList(),
            selected: <Calendar>{calendarView},
            showSelectedIcon: false,
            onSelectionChanged: (Set<Calendar> newSelection) {
              setState(() {
                calendarView = newSelection.first;
              });
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
