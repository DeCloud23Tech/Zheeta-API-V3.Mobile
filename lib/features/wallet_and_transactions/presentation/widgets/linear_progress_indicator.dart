import 'package:flutter/material.dart';

class LinearProgressTracking extends StatelessWidget {
  final List<double> values; // can be any positive numbers
  final List<Color> colors;

  const LinearProgressTracking({
    super.key,
    required this.values,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6, // thickness of the bar
      child: CustomPaint(
        painter: _SegmentedProgressPainter(values, colors),
        size: const Size(double.infinity, 10),
      ),
    );
  }
}

class _SegmentedProgressPainter extends CustomPainter {
  final List<double> values;
  final List<Color> colors;

  _SegmentedProgressPainter(this.values, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    // --- Normalize values ---
    double total = values.fold(0.0, (a, b) => a + b);
    List<double> normalized =
        total > 1 ? values.map((v) => v / total).toList() : values;

    double startX = 0;
    for (int i = 0; i < normalized.length; i++) {
      final segmentWidth = size.width * normalized[i];
      paint.color = colors[i];

      final rect = RRect.fromLTRBR(
        startX,
        0,
        startX + segmentWidth,
        size.height,
        const Radius.circular(5),
      );
      canvas.drawRRect(rect, paint);

      startX += segmentWidth;
    }

    // --- Grey background if total < 1 ---
    final normalizedTotal =
        normalized.fold(0.0, (a, b) => a + b).clamp(0.0, 1.0);
    if (normalizedTotal < 1.0) {
      paint.color = const Color(0xFFDADADA);
      final rect = RRect.fromLTRBR(
        startX,
        0,
        size.width,
        size.height,
        const Radius.circular(5),
      );
      canvas.drawRRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(_SegmentedProgressPainter oldDelegate) {
    return oldDelegate.values != values || oldDelegate.colors != colors;
  }
}
