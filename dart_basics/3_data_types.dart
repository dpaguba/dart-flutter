void main(List<String> args) {
  // Simple data types
  int age = 19;
  double x = 4.4;
  bool y = false;

  // Complex data types
  String name = "Dmytro";
  String surname = "Pahuba";
  String fullname = name + " " + surname;
  print(fullname);

  String multilane = """

I
learn
Dart
""";
  print(multilane);

  // Concatenation of int-value and String
  int value = 19;
  String sentence = "I'm $value years old.";
  print(sentence);

  // Static declaration
  int v;
  v = 1;

  // Automatic declaration
  var v1;
  v1 = "str";

  // Dynamic declaration - bad practice
  dynamic v2;
  v2 = 1;
  v2 = "str";
}
