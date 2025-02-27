import 'package:flutter/material.dart';

class BlaButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;

  const BlaButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.transparent, 
    this.textColor = Colors.blue, 
    this.icon = Icons.chat_bubble_outline, 
  }); 	

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: textColor),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
