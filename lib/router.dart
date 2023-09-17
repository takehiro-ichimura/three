// このGlobalKeyは、GoRouterのインスタンスを取得するために必要です。
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:three/views/pages/details_page_view.dart';
import 'package:three/views/pages/home_page_view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomePageView(navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/',
                builder: (context, state) => const DetailsPageView(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (context, state) {
                      return const DetailsPageView();
                    },
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(routes: <RouteBase>[
            GoRoute(
              path: '/b',
              builder: (context, state) {
                return const DetailsPageView();
              },
            ),
          ]),
        ],
      ),
    ],
  );
});
