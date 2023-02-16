import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mealo/views/home/widgets/meal_randomizer.dart';
import 'package:mealo/widgets/base/card.dart';
import 'package:mealo/widgets/base/scaffold.dart';

import '../../widgets/animation/fader.dart';

class HomeView extends StatelessWidget {
  final ScrollController controller;

  const HomeView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarProperties: AppBarProperties(
        stretch: true,
        expandedHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
          title: LayoutBuilder(
            builder: (context, constraints) => constraints.maxHeight <=
                    kToolbarHeight + MediaQuery.of(context).viewPadding.top - 16
                ? Fader(
                    child: Text(
                      'Mealo',
                      style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
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
      children: const [
        MealRandomizer(),
      ],
    );
  }
}
