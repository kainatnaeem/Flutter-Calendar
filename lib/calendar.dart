import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 56,
            ),
            TableCalendar(
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                headerPadding: const EdgeInsets.symmetric(vertical: 0),
                decoration: const BoxDecoration(color: Colors.black),
                leftChevronIcon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                rightChevronIcon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                titleTextStyle: GoogleFonts.montserrat(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonVisible: false,
              ),
              calendarStyle: CalendarStyle(
                tablePadding: EdgeInsets.symmetric(vertical: 12),
                selectedDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                selectedTextStyle: GoogleFonts.montserrat(color: Colors.white),
              ),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _selectedDay,
              selectedDayPredicate: (day) {
                // Return true if the day is selected
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                });
                _showSelectedDateDialog(context, selectedDay);
              },
            )
          ],
        ),
      ),
    );
  }

  void _showSelectedDateDialog(BuildContext context, DateTime selectedDay) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Selected Date"),
          content: Text("You selected ${selectedDay.toLocal()}"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
