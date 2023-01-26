import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../models/meal.dart';
import '../../../widgets/flutter_modified/translucent_sliver_app_bar.dart';

class MealDetailsView extends StatelessWidget {
  final Meal? meal;

  const MealDetailsView({
    super.key,
    this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          TransculentSliverAppBar(
            title: Text(this.meal?.name ?? 'Unnamed'),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              Hero(
                tag: this.meal?.uuid ?? 'placeholder',
                transitionOnUserGestures: true,
                child: this.meal?.thumbnailBase64 != null
                    ? Image.memory(base64Decode(this.meal!.thumbnailBase64!))
                    : Image.asset('assets/images/meal-placeholder.png'),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
