class Animal {
  String color;
  Animal(this.color);
  void eat() {
    print("Animal");
  }
}

class Dog extends Animal {
  String? owner;

  Dog(super.color, {required this.owner});

  @override
  void eat() {
    print("Dog");
  }
}

class Lion extends Animal {
  String? jungleName;

  Lion(super.color);

  eat() {
    // ---
  }
}
