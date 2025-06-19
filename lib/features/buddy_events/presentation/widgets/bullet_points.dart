import 'package:flutter/material.dart';

class BulletPoint extends StatelessWidget {
  final List<String> items;
  final TextStyle textStyle;

  const BulletPoint({
    super.key,
    required this.items,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  items
          .where((item) => item.toString().trim().isNotEmpty)
          .map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 4.0, left: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '• ',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Expanded(
                child: Text(
                  item,
                  style: textStyle,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
