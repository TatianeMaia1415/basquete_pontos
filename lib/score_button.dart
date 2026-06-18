import 'package:flutter/material.dart';

class ScoreButton extends StatelessWidget {
  const ScoreButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.enabled = true,
  });

  final String label;
  final void Function() onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      child: Text(label),
    );
  }
}