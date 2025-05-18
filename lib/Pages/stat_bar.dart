import 'package:flutter/material.dart';

class StatBar extends StatelessWidget {
  final String label;
  final int value;
  final int max;
  final Color color;

  // Const constructor so you can create constant StatBar widgets
  const StatBar({
    required this.label,
    required this.value,
    required this.max,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: $value'),
        SizedBox(
          width: 150,
          height: 10,
          child: LinearProgressIndicator(
            value: value / max,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}