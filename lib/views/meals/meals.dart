import 'package:flutter/material.dart';
import 'package:mealo/widgets/flutter_modified/translucent_sliver_app_bar.dart';

import 'widgets/meal_grid.dart';

class MealsView extends StatelessWidget {
  const MealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          TransculentSliverAppBar(
            title: const Text('Mealo'),
            pinned: true,
            // stretch: true,
            expandedHeight: 192,
            // backgroundColor: Theme.of(context)
            //     .appBarTheme
            //     .backgroundColor!
            //     .withOpacity(StylingHelper.kOpacityForBlur),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Image.asset(
                  'assets/images/app-icon.png',
                  height: 164,
                ),
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.all(24.0),
            sliver: MealGrid(),
          ),
        ],
      ),
    );
  }
}
