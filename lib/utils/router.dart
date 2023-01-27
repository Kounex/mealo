import 'package:beamer/beamer.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealo/tabs.dart';
import 'package:mealo/views/intro/intro.dart';
import 'package:mealo/views/meals/meals.dart';
import 'package:mealo/views/settings/settings.dart';

import '../types/api/meal.dart';
import '../views/meals/details/details.dart';

typedef BeamerPageBuilder = dynamic Function(
    BuildContext context, BeamState state, Object? data);
typedef RouteEntry = MapEntry<Pattern, BeamerPageBuilder>;

class RouterUtils {
  static final router = BeamerDelegate(
    initialPath: '/intro',
    locationBuilder: RoutesLocationBuilder(
      routes: RouterUtils._routes(
        [
          RouterUtils._routeEntry('/intro', view: const IntroView()),
          RouterUtils._routeEntry('/*', view: const TabsView()),
        ],
      ),
    ),
  );

  static final Map<TabMeta, BeamerDelegate> tabRouter = {}..addEntries(
      TabMeta.values.map(
        (tab) => MapEntry(tab, tab.router),
      ),
    );

  static final Map<TabMeta, ScrollController> tabScrollController = {}
    ..addEntries(
      TabMeta.values.map(
        (tab) => MapEntry(tab, ScrollController()),
      ),
    );

  /// *The* function to navigate throughout the app to ensure consitency
  static void goTo(BuildContext context, BaseRoute route,
      {Object? data, bool replace = false}) {
    if (replace) {
      Beamer.of(context).removeLastHistoryElement();
    }
    Beamer.of(context).beamToNamed(
      route.path,
      data: data,
    );
  }

  /// Private helper functions only used within this file to simplify and
  /// shorten various tasks while defining routes and pages
  static BeamPage _basePage(String path, Widget view, {BeamPageType? type}) =>
      BeamPage(
        key: ValueKey(path),
        type: type ?? BeamPageType.cupertino,
        child: view,
      );

  static Map<Pattern, BeamerPageBuilder> _routes(
          Iterable<RouteEntry> entries) =>
      {}..addEntries(entries);

  static RouteEntry _routeEntry(
    String path, {
    Widget? view,
    BeamerPageBuilder? builder,
    BeamPageType? type,
  }) {
    assert(view != null || builder != null);
    return MapEntry(
      path,
      builder ?? (context, state, data) => _basePage(path, view!, type: type),
    );
  }

//   static final router = GoRouter(
//     initialLocation: HomeRoute().path,
//     routes: [
//       ShellRoute(
//         builder: (context, state, child) => TabsView(
//           child: child,
//         ),
//         routes: [
//           GoRoute(
//             path: HomeRoute().path,
//             pageBuilder: (context, state) => _platformTransition(
//               context,
//               state,
//               _meta(
//                 'Mealo | Home',
//                 const HomeView(),
//               ),
//             ),
//           ),
//           GoRoute(
//             path: SettingsRoute().path,
//             pageBuilder: (context, state) => _platformTransition(
//               context,
//               state,
//               _meta(
//                 'Mealo | Settings',
//                 const SettingsView(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ],
//   );

//   static void navigateTo(BuildContext context, BaseRoute route) {
//     context.go(route.path);
//   }

// Title _meta(String title, Widget view) => Title(
//       color: Colors.black,
//       title: title,
//       child: view,
//     );

// Page _platformTransition(
//   BuildContext context,
//   GoRouterState state,
//   Widget view,
// ) {
//   if (Platform.isIOS || Platform.isMacOS) {
//     return CupertinoPage(
//       key: state.pageKey,
//       child: view,
//     );
//   }
//   if (kIsWeb) {
//     return CustomTransitionPage(
//       key: state.pageKey,
//       child: view,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//           FadeTransition(
//         opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
//         child: child,
//       ),
//     );
//   }
//   return MaterialPage(
//     key: state.pageKey,
//     child: view,
//   );
}

enum TabMeta {
  meals,
  settings;

  String get title {
    switch (this) {
      case TabMeta.meals:
        return 'Meals';
      case TabMeta.settings:
        return 'Settings';
    }
  }

  Icon get icon {
    return Icon(() {
      switch (this) {
        case TabMeta.meals:
          return FluentIcons.food_24_filled;
        case TabMeta.settings:
          return FluentIcons.settings_24_filled;
      }
    }());
  }

  BeamerDelegate get router {
    switch (this) {
      case TabMeta.meals:
        return BeamerDelegate(
          initialPath: '/meals',
          locationBuilder: RoutesLocationBuilder(
            routes: RouterUtils._routes(
              [
                RouterUtils._routeEntry(
                  '/meals',
                  type: BeamPageType.noTransition,
                  view: MealsView(
                    controller: RouterUtils.tabScrollController[this]!,
                  ),
                ),
                RouterUtils._routeEntry(
                  '/meals/:uuid',
                  builder: (context, state, data) {
                    Meal? meal;
                    try {
                      meal = data as Meal;
                    } catch (_) {}
                    return RouterUtils._basePage(
                      '/meals/:uuid',
                      MealDetailsView(meal: meal),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      case TabMeta.settings:
        return BeamerDelegate(
          initialPath: '/settings',
          locationBuilder: RoutesLocationBuilder(
            routes: RouterUtils._routes(
              [
                RouterUtils._routeEntry(
                  '/settings',
                  type: BeamPageType.noTransition,
                  view: SettingsView(
                    controller: RouterUtils.tabScrollController[this]!,
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }
}

abstract class BaseRoute {
  String path;

  BaseRoute(this.path);
}

class MealsRoute extends BaseRoute {
  MealsRoute() : super('/meals');
}

class MealDetailRoute extends MealsRoute {
  MealDetailRoute(String uuid) : super() {
    this.path += '/$uuid';
  }
}

class SettingsRoute extends BaseRoute {
  SettingsRoute() : super('/settings');
}

/// Example of nested routes
// class SlidesRoute extends BaseRoute {
//   SlidesRoute({int? id}) : super('/slides/${id ?? 1}');
// }

// class SlidesDetailsRoute extends SlidesRoute {
//   SlidesDetailsRoute(BuildContext context)
//       : super(
//           id: int.tryParse(GoRouterState.of(context).params['id'] ?? '') ?? 1,
//         ) {
//     path += '/details';
//   }
// }


