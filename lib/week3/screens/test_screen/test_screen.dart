import 'package:flutter/material.dart';
import 'package:my_app/week3/widgets/actions/bla_btn.dart';

void main() {
  runApp(MaterialApp(
    home: TestScreen(
      testWidget: BlaButton(
          text: "Contact Volodia",
          onPressed: () => print("Blue button clicked"),
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          icon: Icons.message, // Different icon
      )
    ),
  ));
}

// Test screen to display any widget
class TestScreen extends StatelessWidget {
  final Widget testWidget;

  const TestScreen({super.key, required this.testWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test Screen")),
      body: Center(child: testWidget),
    );
  }
}