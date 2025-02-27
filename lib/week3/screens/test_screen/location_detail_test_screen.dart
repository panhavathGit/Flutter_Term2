import 'package:flutter/material.dart';
class LocationDetailScreen extends StatelessWidget {
  final String location;

  const LocationDetailScreen({required this.location, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(location)),
      body: Center(
        child: Text(
          "Welcome to $location",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}