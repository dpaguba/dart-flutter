import 'package:flutter/material.dart';
import 'package:my_app/presentation/widgets_examples/widgets_example_page.dart';

// required to start the program
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WidgetsExamplesPage(),
      // remove debug banner from AppBar
      debugShowCheckedModeBanner: false,
    );
  }
}
