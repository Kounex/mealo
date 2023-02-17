import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
                      height: 12.0,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
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
              SizedBox(height: index < rows - 1 ? 8.0 : 0),
            ],
          ),
        ),
      ),
    );
  }
}
