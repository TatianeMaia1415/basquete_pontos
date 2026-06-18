import 'package:flutter/material.dart';

class ScoreButton extends StatelessWidget {
  const ScoreButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon,
    required this.color,
    this.enabled = true,
  });

  final String label;
  final void Function() onPressed;
  final IconData icon;
  final Color color;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: enabled ? onPressed : null,
      icon: Icon(icon, color: enabled ? color : Colors.grey),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: enabled ? color : Colors.grey, width: 1.5),
      ),
    );
  }
}