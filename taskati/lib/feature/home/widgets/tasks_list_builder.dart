import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/text_style.dart';

class TasksListBuilder extends StatelessWidget {
  const TasksListBuilder({
    super.key,
    required this.selectedDate,
  });
  final String selectedDate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: AppLocalStorage.taskBox!.listenable(),
        builder: (context, box, child) {
          List<TaskModel> tasks =
              box.values.where((e) => e.date == selectedDate).toList();
          if (tasks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/images/empty.json'),
                  const Gap(5),
                  Text('No tasks for this day',
                      style: getBodyTextStyle(context,
                          color: AppColors.primaryColor)),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                secondaryBackground: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.delete,
                        color: AppColors.whiteColor,
                      ),
                      Gap(10),
                      Text(
                        'Delete',
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                    ],
                  ),
                ),
                background: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.done,
                        color: AppColors.whiteColor,
                      ),
                      Gap(10),
                      Text(
                        'Complete',
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    box.delete(tasks[index].id);
                  } else {
                    box.put(tasks[index].id,
                        tasks[index].copyWith(isCompleted: true));
                  }
                },
                child: TaskItem(
                  task: tasks[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: getCardColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: getBodyTextStyle(context,
                      fontWeight: FontWeight.w600, color: AppColors.whiteColor),
                ),
                const Gap(5),
                Row(
                  children: [
                    const Icon(
                      Icons.watch_later_outlined,
                      color: AppColors.whiteColor,
                      size: 18,
                    ),
                    const Gap(5),
                    Text('${task.startTime} - ${task.endTime}',
                        style: getSmallTextStyle(
                            color: AppColors.whiteColor, fontSize: 12)),
                  ],
                ),
                const Gap(5),
                Text(
                  task.description,
                  style: getSmallTextStyle(color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
          Container(
            width: .5,
            height: 60,
            color: AppColors.whiteColor,
          ),
          const Gap(8),
          RotatedBox(
            quarterTurns: 3,
            child: Text(task.isCompleted ? 'COMPLETED' : 'TODO',
                style: getSmallTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor)),
          ),
        ],
      ),
    );
  }

  Color getCardColor() {
    if (task.isCompleted) {
      return Colors.green;
    } else {
      if (task.color == 0) {
        return AppColors.primaryColor;
      } else if (task.color == 1) {
        return AppColors.orangeColor;
      } else {
        return AppColors.redColor;
      }
    }
  }
}
