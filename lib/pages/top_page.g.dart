// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_page.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $topPageRoute,
    ];

RouteBase get $topPageRoute => GoRouteData.$route(
      path: '/',
      factory: $TopPageRouteExtension._fromState,
    );

extension $TopPageRouteExtension on TopPageRoute {
  static TopPageRoute _fromState(GoRouterState state) => const TopPageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
