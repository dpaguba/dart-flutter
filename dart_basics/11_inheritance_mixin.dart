void main(List<String> args) {
  Student smdmpahu = Student();
  smdmpahu.setName = "Dmytro";
  smdmpahu.setYear = 4;
  int year = smdmpahu.getYear;
  print(year);
  smdmpahu.goParty();
  smdmpahu.learn();
}

class Person {
  late String _name;
  late int _age;

  String get getName {
    return this._name;
  }

  int get getAge {
    return this._age;
  }

  set setName(String name) {
    this._name = name;
  }

  set setAge(int age) {
    this._age = age;
  }

  void run() {
    print(_name + " runs!");
  }
}

mixin Learner {
  void learn() {
    print("learning...");
  }
}

class Student extends Person with Learner {
  late int year;

  int get getYear {
    return this.year;
  }

  set setYear(int year) {
    this.year = year;
  }

  void goParty() {
    print(_name + " goes to party!");
  }
}
