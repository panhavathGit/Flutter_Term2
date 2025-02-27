import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget? trailing;
  
  const InputField({
    required this.icon,
    required this.text,
    this.trailing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          SizedBox(width: 12),
          Expanded(child: Text(text, style: TextStyle(fontSize: 16))),
          if (trailing != null) trailing!,
        ], 
      ),
    );
  }
}