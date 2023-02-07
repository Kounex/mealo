import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../utils/styling.dart';
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

class TabBarProperties {
  final List<String> titles;
  final List<Widget> children;

  TabBarProperties({
    required this.titles,
    required this.children,
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

  final TabBarProperties? tabBarProperties;

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
    this.tabBarProperties,
    this.controller,
    this.physics,
    this.hasBottomTabBarSpacing = false,
    this.bottomTabBarSpacing,
    this.defaultBottomSpacing = 24,
  });

  Widget _body(BuildContext context) {
    if (this.tabBarProperties != null) {
      return TabBarView(
        physics: this.physics ?? StylingUtils.platformAwareScrollPhysics,
        children: this
            .tabBarProperties!
            .children
            .mapIndexed(
              (index, child) => _customScrollView(
                context,
                tabIndex: index,
              ),
            )
            .toList(),
      );
    }

    return _customScrollView(context);
  }

  Widget _customScrollView(BuildContext context, {int? tabIndex}) => Builder(
        builder: (context) {
          return CustomScrollView(
            key: tabIndex != null
                ? PageStorageKey<String>(
                    this.tabBarProperties!.titles[tabIndex])
                : null,
            controller: this.appBarProperties == null ? this.controller : null,
            primary: this.tabBarProperties == null,
            physics: this.physics ?? StylingUtils.platformAwareScrollPhysics,
            slivers: [
              if (this.appBarProperties != null)
                SliverOverlapInjector(
                  // This is the flip side of the SliverOverlapAbsorber
                  // above.
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
              if (tabIndex == null && this.slivers != null) ...this.slivers!,
              if (tabIndex == null && this.children != null)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => this.children![index],
                    childCount: this.children!.length,
                    findChildIndexCallback: (key) {
                      int index = this
                          .children!
                          .indexWhere((child) => child.key == key);
                      return index >= 0 ? index : null;
                    },
                  ),
                ),
              if (tabIndex != null)
                SliverToBoxAdapter(
                  child: this.tabBarProperties!.children[tabIndex],
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
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    Widget scaffold = Scaffold(
      body: this.appBarProperties != null
          ? NestedScrollView(
              controller: this.controller,
              physics: this.physics ?? StylingUtils.platformAwareScrollPhysics,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                // These are the slivers that show up in the "outer" scroll view.
                return [
                  SliverOverlapAbsorber(
                    // This widget takes the overlapping behavior of the SliverAppBar,
                    // and redirects it to the SliverOverlapInjector below. If it is
                    // missing, then it is possible for the nested "inner" scroll view
                    // below to end up under the SliverAppBar even when the inner
                    // scroll view thinks it has not been scrolled.
                    // This is not necessary if the "headerSliverBuilder" only builds
                    // widgets that do not overlap the next sliver.
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: !this.appBarProperties!.large
                        ? TransculentSliverAppBar(
                            leading: this.appBarProperties!.leading,
                            title: this.appBarProperties!.title,
                            actions: this.appBarProperties!.actions,
                            pinned: this.appBarProperties!.pinned,
                            stretch: this.appBarProperties!.stretch,
                            expandedHeight:
                                this.appBarProperties!.expandedHeight,
                            flexibleSpace: this.appBarProperties!.flexibleSpace,
                            bottom: this.appBarProperties!.bottom ??
                                (this.tabBarProperties != null
                                    ? TabBar(
                                        tabs: this
                                            .tabBarProperties!
                                            .titles
                                            .map((title) => Tab(
                                                  text: title,
                                                ))
                                            .toList())
                                    : null),
                            // The "forceElevated" property causes the SliverAppBar to show
                            // a shadow. The "innerBoxIsScrolled" parameter is true when the
                            // inner scroll view is scrolled beyond its "zero" point, i.e.
                            // when it appears to be scrolled below the SliverAppBar.
                            // Without this, there are cases where the shadow would appear
                            // or not appear inappropriately, because the SliverAppBar is
                            // not actually aware of the precise position of the inner
                            // scroll views.
                            forceElevated: innerBoxIsScrolled,
                          )
                        : TransculentSliverAppBar.large(
                            leading: this.appBarProperties!.leading,
                            title: this.appBarProperties!.title,
                            actions: this.appBarProperties!.actions,
                            pinned: this.appBarProperties!.pinned,
                            stretch: this.appBarProperties!.stretch,
                            expandedHeight:
                                this.appBarProperties!.expandedHeight,
                            flexibleSpace: this.appBarProperties!.flexibleSpace,
                            bottom: this.appBarProperties!.bottom ??
                                (this.tabBarProperties != null
                                    ? TabBar(
                                        tabs: this
                                            .tabBarProperties!
                                            .titles
                                            .map((title) => Tab(
                                                  text: title,
                                                ))
                                            .toList())
                                    : null),
                            forceElevated: innerBoxIsScrolled,
                          ),
                  ),
                ];
              },
              body: _body(context),
            )
          : _customScrollView(context),
    );

    if (this.tabBarProperties != null) {
      return DefaultTabController(
        length: this.tabBarProperties!.titles.length,
        child: scaffold,
      );
    }

    return scaffold;
  }
}
