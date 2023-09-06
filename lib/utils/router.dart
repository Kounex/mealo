import 'package:beamer/beamer.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../tabs.dart';
import '../views/home/home.dart';
import '../views/intro/intro.dart';
import '../views/meals/details/details.dart';
import '../views/meals/meals.dart';
import '../views/randomize_meal/randomize_meal.dart';
import '../views/settings/ratings_tags_management/ratings_tags_management.dart';
import '../views/settings/settings.dart';

typedef BeamerPageBuilder = dynamic Function(
    BuildContext context, BeamState state, Object? data);
typedef RouteEntry = MapEntry<Pattern, BeamerPageBuilder>;

class RouterUtils {
  static final router = BeamerDelegate(
    initialPath: '/intro',
    locationBuilder: RoutesLocationBuilder(
      routes: RouterUtils._routes(
        [
          RouterUtils._routeEntry(
            '/intro',
            view: const IntroView(),
          ),
          RouterUtils._routeEntry(
            '/*',
            view: const TabsView(),
            type: BeamPageType.noTransition,
          ),
        ],
      ),
    ),
  );

  static final Map<TabMeta, BeamerDelegate> tabRouterMap = {}..addEntries(
      TabMeta.values.map(
        (tab) => MapEntry(tab, tab.router),
      ),
    );

  static final Map<TabMeta, ScrollController> tabScrollControllerMap = {}
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
      beamBackOnPop: true,
      data: data,
    );
  }

  /// Private helper functions only used within this file to simplify and
  /// shorten various tasks while defining routes and pages
  static BeamPage _basePage(String path, Widget view, {BeamPageType? type}) =>
      BeamPage(
        key: ValueKey(path),
        name: path,
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
      builder ??
          (context, state, data) => _basePage(
                path,
                view!,
                type: type,
              ),
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
  home,
  meals,
  settings;

  String get title {
    switch (this) {
      case TabMeta.home:
        return 'Home';
      case TabMeta.meals:
        return 'Meals';
      case TabMeta.settings:
        return 'Settings';
    }
  }

  Icon get icon {
    return Icon(() {
      switch (this) {
        case TabMeta.home:
          return FluentIcons.home_24_filled;
        case TabMeta.meals:
          return FluentIcons.food_24_filled;
        case TabMeta.settings:
          return FluentIcons.settings_24_filled;
      }
    }());
  }

  BeamerDelegate get router {
    switch (this) {
      case TabMeta.home:
        return BeamerDelegate(
          initialPath: HomeRoute.blueprint,
          locationBuilder: RoutesLocationBuilder(
            routes: RouterUtils._routes(
              [
                RouterUtils._routeEntry(
                  HomeRoute.blueprint,
                  view: HomeView(
                    controller: RouterUtils.tabScrollControllerMap[this]!,
                  ),
                ),
                RouterUtils._routeEntry(
                  HomeMealDetailRoute.blueprint,
                  builder: (context, state, data) {
                    return RouterUtils._basePage(
                      HomeMealDetailRoute.blueprint,
                      MealDetailsView(uuid: state.pathParameters['uuid']!),
                    );
                  },
                ),
                RouterUtils._routeEntry(
                  HomeRandomizeMealRoute.blueprint,
                  view: RandomizeMealView(
                    controller: RouterUtils.tabScrollControllerMap[this]!,
                  ),
                ),
                RouterUtils._routeEntry(
                  HomeRandomizedMealDetailRoute.blueprint,
                  builder: (context, state, data) {
                    return RouterUtils._basePage(
                      HomeRandomizedMealDetailRoute.blueprint,
                      MealDetailsView(uuid: state.pathParameters['uuid']!),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      case TabMeta.meals:
        return BeamerDelegate(
          initialPath: MealsRoute.blueprint,
          locationBuilder: RoutesLocationBuilder(
            routes: RouterUtils._routes(
              [
                RouterUtils._routeEntry(
                  MealsRoute.blueprint,
                  view: MealsView(
                    controller: RouterUtils.tabScrollControllerMap[this]!,
                  ),
                ),
                RouterUtils._routeEntry(
                  MealDetailRoute.blueprint,
                  builder: (context, state, data) {
                    return RouterUtils._basePage(
                      MealDetailRoute.blueprint,
                      MealDetailsView(uuid: state.pathParameters['uuid']!),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      case TabMeta.settings:
        return BeamerDelegate(
          initialPath: SettingsRoute.blueprint,
          locationBuilder: RoutesLocationBuilder(
            routes: RouterUtils._routes(
              [
                RouterUtils._routeEntry(
                  SettingsRoute.blueprint,
                  view: SettingsView(
                    controller: RouterUtils.tabScrollControllerMap[this]!,
                  ),
                ),
                RouterUtils._routeEntry(
                  RatingsTagsManagementRoute.blueprint,
                  view: const RatingsTagsManagementView(),
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

class HomeRoute extends BaseRoute {
  static String blueprint = '/home';

  HomeRoute() : super('/home');
}

class HomeMealDetailRoute extends HomeRoute {
  static String blueprint = '/home/meals/:uuid';

  HomeMealDetailRoute(String uuid) : super() {
    this.path += '/meals/$uuid';
  }
}

class HomeRandomizeMealRoute extends HomeRoute {
  static String blueprint = '/home/randomize-meal';

  HomeRandomizeMealRoute() : super() {
    this.path += '/randomize-meal';
  }
}

class HomeRandomizedMealDetailRoute extends HomeRandomizeMealRoute {
  static String blueprint = '/home/randomize-meal/:uuid';

  HomeRandomizedMealDetailRoute(String uuid) : super() {
    this.path += '/$uuid';
  }
}

class MealsRoute extends BaseRoute {
  static String blueprint = '/meals';

  MealsRoute() : super('/meals');
}

class MealDetailRoute extends MealsRoute {
  static String blueprint = 'meals/:uuid';

  MealDetailRoute(String uuid) : super() {
    this.path += '/$uuid';
  }
}

class SettingsRoute extends BaseRoute {
  static String blueprint = '/settings';

  SettingsRoute() : super('/settings');
}

class RatingsTagsManagementRoute extends SettingsRoute {
  static String blueprint = 'settings/ratings-tags-management';

  RatingsTagsManagementRoute() : super() {
    this.path += '/ratings-tags-management';
  }
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


