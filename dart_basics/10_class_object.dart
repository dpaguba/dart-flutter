void main(List<String> args) {
  Car car1 = Car(model: "Tesla X", hp: 250, YEAR: 2016);
  car1.setColor = "black";

  Car car2 = Car(model: "BMW", hp: 344, YEAR: 2014);
  car2.setColor = "white";

  String color1 = car1.getColor;
  print(color1);
}

class Car {
  late String _color;
  late String _model;
  late int _hp;
  final int YEAR;

  // Constructor
  Car({required String model, required int hp, required this.YEAR}) {
    this._model = model;
    this._hp = hp;
    drive();
  }

  set setColor(String color) {
    this._color = color;
  }

  String get getColor {
    return this._color;
  }

  void drive() {
    print(_model + " is moving!");
    _info();
  }

  void _info() {
    print("It has $_hp horsepower!");
  }
}
