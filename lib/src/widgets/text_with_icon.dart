import 'package:flutter/material.dart';

class TextWithIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const TextWithIcon({super.key, required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color,),
        const SizedBox(width: 8.0),
        Text(text, style: TextStyle(color: color)),
      ],
    );
  }
}
