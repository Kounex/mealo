import 'package:beamer/beamer.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealo/tabs.dart';
import 'package:mealo/views/meals/meals.dart';
import 'package:mealo/views/settings/settings.dart';

typedef BeamerPageBuilder = dynamic Function(BuildContext, BeamState, Object?);
typedef RouteEntry = MapEntry<Pattern, BeamerPageBuilder>;

class RouterUtils {
  static final router = BeamerDelegate(
    initialPath: '/meals',
    locationBuilder: RoutesLocationBuilder(
      routes: RouterUtils.routes(
        [
          RouterUtils.routeEntry('/intro', view: const MealsView()),
          RouterUtils.routeEntry('/*', view: const TabsView()),
        ],
      ),
    ),
  );

  static final tabRouter = {}..addEntries(
      TabMeta.values.map(
        (tab) => MapEntry(tab, tab.router),
      ),
    );

  static Map<Pattern, BeamerPageBuilder> routes(Iterable<RouteEntry> entries) =>
      {}..addEntries(entries);

  static RouteEntry routeEntry(String path,
      {Widget? view, BeamerPageBuilder? builder}) {
    assert(view != null || builder != null);
    return MapEntry(
      path,
      builder ??
          (context, state, data) => BeamPage(key: ValueKey(path), child: view!),
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
            routes: RouterUtils.routes(
              [
                RouterUtils.routeEntry('/meals', view: const MealsView()),
                RouterUtils.routeEntry('/meals/:uuid', view: const MealsView()),
              ],
            ),
          ),
        );
      case TabMeta.settings:
        return BeamerDelegate(
          initialPath: '/settings',
          locationBuilder: RoutesLocationBuilder(
            routes: RouterUtils.routes(
              [
                RouterUtils.routeEntry('/settings', view: const SettingsView()),
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


