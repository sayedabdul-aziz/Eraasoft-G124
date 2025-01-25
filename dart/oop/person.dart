enum Gender { male, female }

class Person {
  // attr
  String? name;
  Gender? gender;
  int? _age;

  // meth
  set setAge(int age) {
    if (age > 0) {
      this._age = age;
    } else {
      print('invalid value');
    }
  }

  int get getAge => this._age ?? 0;

  void display() {
    print('$name, $_age, $gender');
  }
}
