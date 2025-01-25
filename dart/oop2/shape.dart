import 'dart:math';

abstract class Shape {
  double d1;
  Shape(this.d1);
  getArea();
  display() {
    print('Display');
  }
}

class Circle extends Shape {
  Circle(super.d1);

  @override
  getArea() {
    print('Area: ${pi * d1 * d1}');
  }
}

class Square extends Shape {
  Square(super.d1);

  @override
  getArea() {
    print("Area : ${d1 * d1}");
  }
}
