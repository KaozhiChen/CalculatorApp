import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final int flex;
  static const topKeys = ["AC", "+/-", "%"];
  static const rightKeys = ["/", "*", "-", "+", "="];

  const ButtonWidget({required this.label, this.flex = 1, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: TextButton(
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: topKeys.contains(label)
                  ? Colors.grey[400]
                  : rightKeys.contains(label)
                      ? Colors.orange
                      : Colors.grey[800],
              borderRadius: flex > 1
                  ? const BorderRadius.all(Radius.circular(1000.0))
                  : null,
              shape: flex > 1 ? BoxShape.rectangle : BoxShape.circle),
          child: Center(
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                softWrap: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
