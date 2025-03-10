import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/extentions/extenstions.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/home/page/home_screen.dart';

// class model with hive annotation
// generate type adapter for the model
// create a box for tasks and opened it
// register the adapter

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  int selectedColor = 0;

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat("dd/MM/yyyy").format(DateTime.now());
    startTimeController.text = DateFormat("hh:mm a").format(DateTime.now());
    endTimeController.text = DateFormat("hh:mm a").format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleField(),
              const Gap(10),
              descriptionField(),
              const Gap(10),
              dateField(context),
              const Gap(10),
              timeField(context),
              const Gap(20),
              Row(
                children: [
                  colorsWidget(),
                  const Spacer(),
                  CustomButton(
                      width: 145,
                      text: 'Create Task',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          var key =
                              DateTime.now().millisecondsSinceEpoch.toString() +
                                  titleController.text;
                          await AppLocalStorage.cacheTask(
                              key,
                              TaskModel(
                                  id: key,
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  date: dateController.text,
                                  startTime: startTimeController.text,
                                  endTime: endTimeController.text,
                                  color: selectedColor,
                                  isCompleted: false));

                          context.pushReplacement(const HomeScreen());
                        }
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row colorsWidget() {
    return Row(
      children: List.generate(3, (index) {
        return Padding(
          padding: const EdgeInsets.all(2),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedColor = index;
              });
            },
            child: CircleAvatar(
              backgroundColor: index == 0
                  ? AppColors.primaryColor
                  : index == 1
                      ? AppColors.orangeColor
                      : AppColors.redColor,
              child: (selectedColor == index)
                  ? const Icon(Icons.check, color: Colors.white)
                  : null,
            ),
          ),
        );
      }),
    );
  }

  Column titleField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Title",
          style: getBodyTextStyle(context, fontWeight: FontWeight.w500),
        ),
        const Gap(7),
        TextFormField(
          controller: titleController,
          decoration: const InputDecoration(
            hintText: "Enter title",
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "*Required";
            }
            return null;
          },
        ),
      ],
    );
  }

  Column descriptionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: getBodyTextStyle(context, fontWeight: FontWeight.w500),
        ),
        const Gap(7),
        TextFormField(
          controller: descriptionController,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: "Enter description",
          ),
        ),
      ],
    );
  }

  Column dateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date",
          style: getBodyTextStyle(context, fontWeight: FontWeight.w500),
        ),
        const Gap(7),
        TextFormField(
          readOnly: true,
          controller: dateController,
          onTap: () async {
            var pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2030));
            if (pickedDate != null) {
              dateController.text = DateFormat("dd/MM/yyyy").format(pickedDate);
            }
          },
          decoration: const InputDecoration(
            suffixIcon: Icon(
              Icons.calendar_month_rounded,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Row timeField(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Start Time",
                style: getBodyTextStyle(context, fontWeight: FontWeight.w500),
              ),
              const Gap(7),
              TextFormField(
                controller: startTimeController,
                readOnly: true,
                onTap: () async {
                  var pickTime = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                  if (pickTime != null) {
                    startTimeController.text = pickTime.format(context);
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Enter time",
                  suffixIcon: Icon(
                    Icons.access_time_rounded,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "End Time",
                style: getBodyTextStyle(context, fontWeight: FontWeight.w500),
              ),
              const Gap(7),
              TextFormField(
                controller: endTimeController,
                readOnly: true,
                onTap: () async {
                  var pickTime = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                  if (pickTime != null) {
                    endTimeController.text = pickTime.format(context);
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Enter time",
                  suffixIcon: Icon(
                    Icons.access_time_rounded,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
