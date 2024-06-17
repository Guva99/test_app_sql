import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app_sql/feature/app/app.dart';
import 'package:test_app_sql/feature/app/routing/path_route.dart';
import 'package:test_app_sql/feature/app/routing/scaffold_with_nested_navigation.dart';
import 'package:test_app_sql/feature/home_page/presentation/home_page.dart';
import 'package:test_app_sql/feature/order_list/presentation/order_list.dart';
 import 'package:test_app_sql/feature/products/presentation/page/product_page.dart';

class MainRouteApp extends StatefulWidget {
  const MainRouteApp({super.key});

  @override
  State<MainRouteApp> createState() => _MainRouteAppState();
}

class _MainRouteAppState extends State<MainRouteApp> {
  @override
  Widget build(BuildContext context) {
    final rootNavigatorKey = GlobalKey<NavigatorState>();
    final shellNavigatorHomeScreenKey = GlobalKey<NavigatorState>(debugLabel: 'shellHomeScreen');
    final shellNavigatorProfileScreenKey = GlobalKey<NavigatorState>(debugLabel: 'shellProfileScreen');

    final goRouter = GoRouter(
        navigatorKey: rootNavigatorKey,
        initialLocation: AppRoute.homeScreenPath,
        routes: [
          StatefulShellRoute.indexedStack(
            branches: [
              ///****+*[HOME MENU]*****///
              StatefulShellBranch(
                navigatorKey: shellNavigatorHomeScreenKey,
                routes: [
                  GoRoute(
                    path: AppRoute.homeScreenPath,
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: HomePage(),
                    ),
                  ),
                  GoRoute(
                    path: AppRoute.productPagePath,
                    pageBuilder: (context, state) =>   NoTransitionPage(
                      child: ProductsPage(
                        tableNumber: state.extra as int,
                      ),
                    ),
                  ),

                ],
              ),

              ///****+*[PROFILE MENU]*****///
              StatefulShellBranch(
                navigatorKey: shellNavigatorProfileScreenKey,
                routes: [
                  GoRoute(
                    path: AppRoute.orderListScreenPath,
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: OrderListPage(),
                    ),
                  ),
                ],
              ),
            ],
            builder: (context, state, navigationShell) {
              return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
            },
          )
        ],
        errorBuilder: ((context, state) => Container()));

    return App(goRouter: goRouter);
  }
}
