import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;

  const ButtonWidget({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration:
            BoxDecoration(color: Colors.grey[800], shape: BoxShape.circle),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
