// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_page.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $roomPageRoute,
    ];

RouteBase get $roomPageRoute => GoRouteData.$route(
      path: '/room/:id',
      factory: $RoomPageRouteExtension._fromState,
    );

extension $RoomPageRouteExtension on RoomPageRoute {
  static RoomPageRoute _fromState(GoRouterState state) => RoomPageRoute(
        id: int.parse(state.pathParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/room/${Uri.encodeComponent(id.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
