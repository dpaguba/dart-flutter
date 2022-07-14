import 'package:flutter/material.dart';
import 'package:my_app/presentation/widgets_examples/widgets/container_text_example.dart';
import 'package:my_app/presentation/widgets_examples/widgets/profile_picture.dart';
import 'package:my_app/presentation/widgets_examples/widgets/rectangular_image.dart';
import 'package:my_app/presentation/widgets_examples/widgets/row_expanded_example.dart';

class WidgetsExamplesPage extends StatelessWidget {
  const WidgetsExamplesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Styles for body
      backgroundColor: Colors.grey[900],

      // AppBar
      appBar: AppBar(
        // Styles for AppBar
        // another property to center the title in appBar
        centerTitle: true,
        backgroundColor: Colors.blue[200],

        // Create leading button
        leading: const Icon(
          Icons.home,
          size: 40,
        ),

        title: const Text("Widgets Example"),
      ),

      // Body
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ContainerTextExample(),
              SizedBox(
                height: 10,
              ),
              RowExpandedExample(),
              SizedBox(
                height: 10,
              ),
              ProfilePicture(),
              SizedBox(
                height: 10,
              ),
              RectImage(),
            ],
          ),
        ),
      ),
    );
  }
}
