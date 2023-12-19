import 'dart:math';
import 'package:flutter/material.dart';
import 'package:interview_app/utils/utils.dart';
import 'package:interview_app/views/widgets/days_cards.dart';
import 'package:interview_app/views/widgets/week_cards.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Calendar calendarView = Calendar.day;

  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
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
      body: DefaultTabController(
        length: allTabs.length,
        child: Column(
          children: [
            TableCalendar(
              availableCalendarFormats: Map<CalendarFormat, String>.from({
                CalendarFormat.week: 'Week',
              }),
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              calendarFormat: CalendarFormat.week,
              rangeSelectionMode: calendarView == Calendar.day
                  ? RangeSelectionMode.toggledOff
                  : RangeSelectionMode.toggledOn,
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    _rangeStart = null; // Important to clean those
                    _rangeEnd = null;
                  });
                }
              },
              onRangeSelected: (start, end, focusedDay) {
                setState(() {
                  _selectedDay = null;
                  _focusedDay = focusedDay;
                  _rangeStart = start;
                  _rangeEnd = end;
                });
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            //    const SizedBox(height: 8),
            TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
              tabs: allTabs
                  .asMap()
                  .entries
                  .map(
                    (e) => Tab(
                      text: "${e.value} (${Random(e.key).nextInt(100)})",
                    ),
                  )
                  .toList(),
            ),

            if (calendarView == Calendar.day)
              Expanded(
                child: _selectedDay == null
                    ? Center(
                        child: Text(
                          'Select a date',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 18,
                          ),
                        ),
                      )
                    : TabBarView(
                        children: allTabs
                            .asMap()
                            .entries
                            .map(
                              (e) => ListView.builder(
                                itemCount: randomNames.length,
                                itemBuilder: (context, index) {
                                  final data = randomNames[index];
                                  return daysCardWidget(data, context);
                                },
                              ),
                            )
                            .toList(),
                      ),
              )
            else if (calendarView == Calendar.week)
              if (_rangeStart != null && _rangeEnd != null)
                Expanded(
                  child: TabBarView(
                    children: allTabs
                        .asMap()
                        .entries
                        .map(
                          (e) => ListView.builder(
                            itemCount:
                                daysInRange(_rangeStart!, _rangeEnd!).length,
                            itemBuilder: (context, index) {
                              final day =
                                  daysInRange(_rangeStart!, _rangeEnd!)[index];
                              return weekCardWidget(day: day, allTabs: allTabs);
                            },
                          ),
                        )
                        .toList(),
                  ),
                )
              else
                Center(
                  child: Text(
                    'Select a range of days',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 18,
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
