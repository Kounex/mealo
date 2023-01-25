import 'package:flutter/material.dart';
import 'package:mealo/utils/styling.dart';
import 'package:mealo/views/home/widgets/meal_grid.dart';
import 'package:mealo/views/home/widgets/theme_switcher.dart';
import 'package:mealo/widgets/flutter_modified/translucent_sliver_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
            backgroundColor: Theme.of(context)
                .appBarTheme
                .backgroundColor!
                .withOpacity(StylingHelper.kOpacityForBlur),
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
          const SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                ThemeSwitcher(),
              ],
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
