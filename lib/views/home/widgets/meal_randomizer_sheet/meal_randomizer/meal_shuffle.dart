import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../widgets/shared/meal_card.dart';

class MealShuffle extends StatelessWidget {
  final Duration duration;

  const MealShuffle({
    super.key,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return const MealCard(
      height: 200.0,
      width: 250.0,
    )
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
