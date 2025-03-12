import 'package:flutter/material.dart';
import 'package:my_app/ClassWork/main.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(body: HomeScreen()),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ColorBtn extends StatelessWidget {
  final VoidCallback increment;
  const ColorBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
