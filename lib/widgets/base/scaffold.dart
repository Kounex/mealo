import 'package:flutter/material.dart';
import 'package:mealo/utils/styling.dart';

import '../flutter_modified/translucent_sliver_app_bar.dart';

class AppBarProperties {
  final Widget? title;
  final bool large;
  final bool pinned;
  final bool stretch;
  final double? expandedHeight;
  final Widget? flexibleSpace;
  final Widget? leading;
  final List<Widget>? actions;
  PreferredSizeWidget? bottom;

  AppBarProperties({
    this.title,
    this.large = false,
    this.pinned = true,
    this.stretch = false,
    this.expandedHeight,
    this.flexibleSpace,
    this.leading,
    this.actions,
    this.bottom,
  });
}

class BaseScaffold extends StatelessWidget {
  /// Slivers are priorizized, meaning they will be added first if provided and
  /// children after that. Therefore both can be provided if wanted and done
  /// correctly - although making use of only one of them is recommended
  /// for full control
  final List<Widget>? slivers;

  /// Slivers are priorizized, meaning they will be added first if provided and
  /// children after that. Therefore both can be provided if wanted and done
  /// correctly - although making use of only one of them is recommended
  /// for full control
  final List<Widget>? children;

  final ScrollController? controller;
  final ScrollPhysics? physics;

  final AppBarProperties? appBarProperties;

  /// Basically a [SizedBox] as the list item in the body. Only useful when we
  /// have something like a [BottomNavigationBar] which is using space at the
  /// bottom of our body in a [Stack] (if the [bottomNavigationBar] property
  /// of a [Scaffold] is used, space is already been added automatically)
  final bool hasBottomTabBarSpacing;

  /// We can set our own spacing here if needed - default value will be
  /// calculated by:
  ///
  ///   kBottomNavigationBarHeight +
  ///   MediaQuery.of(context).viewPadding.bottom +
  ///   XY (depending on the kind of navigation bar used)
  final double? bottomTabBarSpacing;

  /// Usually we never want to have no spacing at the bottom of our body
  /// so we set a default of [24] here. Depending on the content though,
  /// sometimes the last widget has spacing on its own so it might make
  /// sense to be able to override it
  final double defaultBottomSpacing;

  const BaseScaffold({
    super.key,
    this.slivers,
    this.children,
    this.appBarProperties,
    this.controller,
    this.physics,
    this.hasBottomTabBarSpacing = false,
    this.bottomTabBarSpacing,
    this.defaultBottomSpacing = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: this.controller,
        physics: this.physics ?? StylingUtils.platformAwareScrollPhysics,
        slivers: [
          if (this.appBarProperties != null)
            if (!this.appBarProperties!.large)
              TransculentSliverAppBar(
                leading: this.appBarProperties!.leading,
                title: this.appBarProperties!.title,
                actions: this.appBarProperties!.actions,
                pinned: this.appBarProperties!.pinned,
                stretch: this.appBarProperties!.stretch,
                expandedHeight: this.appBarProperties!.expandedHeight,
                flexibleSpace: this.appBarProperties!.flexibleSpace,
                bottom: this.appBarProperties!.bottom,
              ),
          if (this.appBarProperties!.large)
            TransculentSliverAppBar.large(
              leading: this.appBarProperties!.leading,
              title: this.appBarProperties!.title,
              actions: this.appBarProperties!.actions,
              pinned: this.appBarProperties!.pinned,
              stretch: this.appBarProperties!.stretch,
              expandedHeight: this.appBarProperties!.expandedHeight,
              flexibleSpace: this.appBarProperties!.flexibleSpace,
              bottom: this.appBarProperties!.bottom,
            ),
          if (this.slivers != null) ...this.slivers!,
          if (this.children != null)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => this.children![index],
                childCount: this.children!.length,
                findChildIndexCallback: (key) {
                  int index =
                      this.children!.indexWhere((child) => child.key == key);
                  return index >= 0 ? index : null;
                },
              ),
            ),
          if (this.hasBottomTabBarSpacing)
            SliverToBoxAdapter(
              child: SizedBox(
                height: this.bottomTabBarSpacing ??
                    (kBottomNavigationBarHeight +
                        MediaQuery.of(context).viewPadding.bottom +
                        2),
              ),
            ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: this.defaultBottomSpacing,
            ),
          )
        ],
      ),
    );
  }
}
