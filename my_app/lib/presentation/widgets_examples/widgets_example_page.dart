import 'package:flutter/material.dart';

class WidgetsExamplesPage extends StatelessWidget {
  const WidgetsExamplesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Styles for body
      backgroundColor: Colors.grey[900],

      // AppBar
      appBar: AppBar(
        // Create leading button
        leading: const Icon(
          Icons.home,
          size: 40,
        ),
        // another property to center the title in appBar
        // centerTitle: true,

        // Styles for AppBar
        backgroundColor: Colors.blue[200],

        title: const Center(child: Text("Widgets Example")),
      ),

      // Body
      body: const Center(
        child: Text("Hello World!"),
      ),
    );
  }
}
