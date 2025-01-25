import 'person.dart';

void main() {
  Person p1 = Person();
  p1.name = 'Ahmed';
  p1.setAge = 22;
  p1.gender = Gender.male;
  p1.display();
}
