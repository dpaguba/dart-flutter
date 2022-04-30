void main(List<String> args) {
  int i = 0;

  // While-loop
  while (i < 4) {
    i++;
    print("Lesson №$i");
  }

  // do-while-loop
  i = 0;
  do {
    i++;
    print("Lesson №$i");
  } while (i < 4);

  List<int> arr = [];
  // for-loop
  for (int j = 0; j < i; j++) {
    arr.add(j);
  }
  print(arr);

  // forEach-loop
  arr.forEach((num) {
    print(num);
  });
}
