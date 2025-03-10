import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/themes.dart';
import 'package:taskati/feature/intro/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox("userBox");
  await Hive.openBox<TaskModel>("taskBox");
  AppLocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppLocalStorage.userBox!.listenable(),
      builder: (context, box, child) {
        bool isDarkTheme =
            AppLocalStorage.getCachedData(AppLocalStorage.isDarkTheme) ?? false;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const SplashScreen(),
        );
      },
    );
  }
}
