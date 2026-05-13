import 'package:flutter/material.dart';

class ChipsWidget extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;
  final String value;
  final double iconSize;

  const ChipsWidget({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.value,
    this.iconSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1.2),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.05), blurRadius: 8, spreadRadius: 1)
        ]
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize, color: color),
          const SizedBox(width: 8),
          Text(
            "$label: $value",
            style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.white, fontSize: 13, letterSpacing: 0.5),
          ),
        ],
      ),
    );
  }
}