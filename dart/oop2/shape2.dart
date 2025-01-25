import 'dart:math';

abstract class Area {
  getArea();
}

abstract class Perimeter {
  getPerimeter();
}

class Circle implements Area, Perimeter {
  double d1;
  Circle(this.d1);

  @override
  getArea() {
    print('Area: ${pi * d1 * d1}');
  }

  @override
  getPerimeter() {
    print('Area: ${pi * 2 * d1}');
  }
}
