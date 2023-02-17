import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mealo/views/meals/widgets/meal_card.dart';

class MealShuffle extends StatelessWidget {
  final Duration duration;

  const MealShuffle({
    super.key,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return const MealCard()
        .animate()
        .shake(
          duration: this.duration,
          hz: 4,
          curve: Curves.easeIn,
        )
        .blurXY(
          curve: Curves.easeIn,
          delay: this.duration * 0.3,
          end: 20,
        );
  }
}
