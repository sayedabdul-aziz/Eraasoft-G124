class Person {
  int? id;
  String? name;
}

class Student extends Person {
  int? grade;

  // Student({this.id, this.name, this.grade});

  displayStudentInfo() {
    print('$id , $name , $grade');
  }
}

class Doctor extends Person {
  double? salary;

  // Doctor({this.id, this.name, this.salary});

  displayDoctorInfo() {
    print('$id , $name , $salary');
  }
}
