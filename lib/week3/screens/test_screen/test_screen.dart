import 'package:flutter/material.dart';
import 'package:my_app/week3/widgets/actions/bla_btn.dart';
import 'package:my_app/week3/widgets/inputs/ride_preferences_form.dart';

void main() {
  runApp(MaterialApp(
    home: TestScreen(
      testWidget: SearchFormScreen() // Different icon
      )
    ),
  );
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