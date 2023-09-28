import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socket_io_demo/pages/room_page.dart';

part 'top_page.g.dart';

@TypedGoRoute<TopPageRoute>(
  path: '/',
)
class TopPageRoute extends GoRouteData {
  const TopPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const TopPage();
}

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter x Socket.io Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => const RoomPageRoute(id: 1).push(context),
              child: const Text('ルーム1へ'),
            ),
          ],
        ),
      ),
    );
  }
}
