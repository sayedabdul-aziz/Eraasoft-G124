import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/home/widgets/home_header.dart';
import 'package:taskati/feature/home/widgets/tasks_list_builder.dart';
import 'package:taskati/feature/home/widgets/today_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectDate = DateFormat("dd/MM/yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const HomeHeader(),
              const Gap(15),
              const TodayWidget(),
              const Gap(15),
              DatePicker(
                DateTime.now(),
                width: 70,
                height: 90,
                initialSelectedDate: DateTime.now(),
                dayTextStyle: getBodyTextStyle(context, fontSize: 14),
                monthTextStyle: getBodyTextStyle(context, fontSize: 14),
                dateTextStyle:
                    getBodyTextStyle(context, fontWeight: FontWeight.w500),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  setState(() {
                    selectDate = DateFormat("dd/MM/yyyy").format(date);
                  });
                },
              ),
              const Gap(15),
              TasksListBuilder(
                selectedDate: selectDate,
              )
            ],
          ),
        ),
      ),
    );
  }
}
