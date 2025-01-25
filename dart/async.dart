Future<void> main() async {
  print("task1");
  await Future.delayed(Duration(seconds: 3), () {
    print("Task2");
  });
  print("task3");
}
