import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mealo/views/home/home.dart';

class RouterUtils {
  static final router = GoRouter(
    initialLocation: HomeRoute().path,
    routes: [
      ShellRoute(
        builder: (context, state, child) => Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            destinations: const [
              NavigationDestination(
                icon: Icon(CupertinoIcons.add),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(CupertinoIcons.add),
                label: 'Settings',
              ),
            ],
          ),
        ),
        routes: [
          GoRoute(
            path: HomeRoute().path,
            pageBuilder: (context, state) => _platformTransition(
              context,
              state,
              _meta(
                'Mealo',
                const HomeView(),
              ),
            ),
          ),
        ],
      ),
    ],
  );

  static void navigateTo(BuildContext context, BaseRoute route) {
    context.go(route.path);
  }
}

abstract class BaseRoute {
  String path;

  BaseRoute(this.path);
}

class HomeRoute extends BaseRoute {
  HomeRoute() : super('/home');
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

Title _meta(String title, Widget view) => Title(
      color: Colors.black,
      title: title,
      child: view,
    );

Page _platformTransition(
  BuildContext context,
  GoRouterState state,
  Widget view,
) {
  if (Platform.isIOS || Platform.isMacOS) {
    return CupertinoPage(
      key: state.pageKey,
      child: view,
    );
  }
  if (kIsWeb) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: view,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      ),
    );
  }
  return MaterialPage(
    key: state.pageKey,
    child: view,
  );
}
