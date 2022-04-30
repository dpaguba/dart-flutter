void main(List<String> args) {
  doSomething();

  sum(10, 11);

  String fullname = concatenate(" Dmytro ", " Pahuba\n");
  print(fullname);

  print(substract(x: 132, y: 5));
}

void sum(int x, int y) {
  print(x + y);
}

void doSomething() {
  print("object");
}

String concatenate(String firstName, String lastName) {
  return firstName.trim() + " " + lastName.trim();
}

// the only difference between an required and a normal parameter passing is
// that when we pass values,
//we must specify which parameter we pass the value to
int substract({required x, required y}) {
  return x - y;
}
