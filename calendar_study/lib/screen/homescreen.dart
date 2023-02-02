import 'package:calendar_study/component/calendar.dart';
import 'package:calendar_study/component/schedule_card.dart';
import 'package:calendar_study/component/today_banner.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              selectedDay: selectedDay,
              focusedDay: focusedDay,
              onDaySelected: OnDaySelected,
            ),
            TodayBanner(
              selectedDay: DateTime.now(),
              scheduleCount: 3,
            ),
            SizedBox(
              height: 6,
            ),
            ScheduleCard(
                      startTime: scheduleWithColor.schedule.startTime,
                      endTime: scheduleWithColor.schedule.endTime,
                      content: scheduleWithColor.schedule.content,
                      color: Color(
                        int.parse('FF${scheduleWithColor.categoryColor.hexCode}',
                            radix: 16),
          ],
        ),
      ),
    );
  }

  OnDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(
      () {
        this.selectedDay = selectedDay;
        this.focusedDay = selectedDay;
      },
    );
  }
}
