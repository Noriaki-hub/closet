import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AppColors {
  static const Color white = Color(0xFFf5f5f5);

  static const Color theme = Color(0xFFc70067);

  static const Color text = Color(0xFF24140e);

  static const Color subText = Color(0xFF727171);

  static const LinearGradient gradiention = LinearGradient(
    colors: [
      Color(0xFF38b48b),
      Color(0xFF2ca9e1),
      Color(0xFF1e50a2),
    ],
  );
}

class GradientionIcon extends StatelessWidget {
  GradientionIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      shaderCallback: (Rect rect) {
        return LinearGradient(
          colors: [
            Color(0xFF38b48b),
            Color(0xFF2ca9e1),
            Color(0xFF1e50a2),
          ],
        ).createShader(rect);
      },
    );
  }
}
