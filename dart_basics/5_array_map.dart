void main(List<String> args) {
  // this list can contain all data types, thus it is dynamic
  List list = [1, 2, "str"];

  // Static
  List<int> list_int = [1, 2, 3];

  print(list_int);
  print(list_int[0]);
  print(list.first);
  print(list.length);

  list.add(false);
  print(list);

  // Static
  Map<int, String> map = {1: "str1", 2: "str2", 3: "str3"};
  print(map.length);
  print(map.keys);
  print(map[3]);
}
