import 'package:flutter/material.dart';

class CommonCountWidget extends StatelessWidget {
  const CommonCountWidget({
    super.key,
    required this.count,
    required this.name,
    this.fillColor,
  });

  final String name;
  final int count;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: fillColor,
            border: Border.all(
              color: fillColor ?? Colors.grey.shade300,
            ),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              count.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: (fillColor != null) ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
