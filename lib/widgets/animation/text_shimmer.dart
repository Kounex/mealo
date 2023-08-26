import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/design_system.dart';

class TextShimmer extends StatelessWidget {
  final int rows;

  const TextShimmer({
    super.key,
    this.rows = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[850]!
          : Colors.grey[300]!,
      highlightColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[800]!
          : Colors.grey[200]!,
      child: Column(
        children: List.generate(
          this.rows,
          (index) => Column(
            children: [
              Row(
                children: [
                  Flexible(
                    flex: index < rows - 1 ? 10 : 4,
                    child: Container(
                      height: DesignSystem.spacing.x12,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(DesignSystem.border.radius12),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: index < rows - 1 ? 0 : 6,
                    child: const SizedBox(),
                  ),
                ],
              ),
              SizedBox(height: index < rows - 1 ? DesignSystem.spacing.x8 : 0),
            ],
          ),
        ),
      ),
    );
  }
}
