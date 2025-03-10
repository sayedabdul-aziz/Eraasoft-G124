import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/extentions/extenstions.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/core/widgets/dialogs.dart';
import 'package:taskati/feature/home/page/home_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? path;
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && nameController.text.isNotEmpty) {
                  AppLocalStorage.cacheData(
                      AppLocalStorage.nameKey, nameController.text);
                  AppLocalStorage.cacheData(AppLocalStorage.imageKey, path);
                  AppLocalStorage.cacheData(AppLocalStorage.isUploaded, true);
                  context.pushReplacement(const HomeScreen());
                } else if (path == null && nameController.text.isNotEmpty) {
                  showErrorToast(context, "Please select an image");
                } else if (path != null && nameController.text.isEmpty) {
                  showErrorToast(context, "Please enter a name");
                } else {
                  showErrorToast(
                      context, "Please select an image and enter a name");
                }
              },
              child: Text(
                "Done",
                style: getBodyTextStyle(context, color: AppColors.primaryColor),
              )),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.primaryColor,
                backgroundImage: path != null
                    ? FileImage(File(path!)) as ImageProvider
                    : const AssetImage("assets/images/user.png"),
              ),
              const SizedBox(height: 20),
              CustomButton(
                width: 250,
                text: "Upload From Camera",
                onPressed: () {
                  uploadImage(true);
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                width: 250,
                text: "Upload From Gallery",
                onPressed: () {
                  uploadImage(false);
                },
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Enter Your Name",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  uploadImage(bool isCamera) async {
    XFile? pickedImage = await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
