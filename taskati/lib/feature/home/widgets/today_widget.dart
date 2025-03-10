import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/extentions/extenstions.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/add_task/page/add_task_screen.dart';

class TodayWidget extends StatelessWidget {
  const TodayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMEd().format(DateTime.now()),
                style: getTitleTextStyle(context, fontWeight: FontWeight.w600),
              ),
              Text(
                "Today",
                style: getBodyTextStyle(context, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const Gap(10),
        CustomButton(
            width: 138,
            text: '+ Add Task',
            onPressed: () {
              context.pushTo(const AddTaskScreen());
            })
      ],
    );
  }
}
