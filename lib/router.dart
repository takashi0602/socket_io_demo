import 'package:go_router/go_router.dart';
import 'package:socket_io_demo/pages/room_page.dart';
import 'package:socket_io_demo/pages/top_page.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: const TopPageRoute().location,
  routes: [$topPageRoute, $roomPageRoute],
);
