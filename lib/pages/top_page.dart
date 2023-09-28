import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:socket_io_demo/features/room/api/rooms.dart';
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
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomsAsyncNotifier = ref.watch(roomsAsyncNotifierProvider);
    return roomsAsyncNotifier.when(
      data: (rooms) {
        return ListView.builder(
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            final room = rooms[index];

            return ListTile(
              title: Text('Room ${room.id}'),
              trailing: const Icon(Icons.navigate_next),
              onTap: () {
                RoomPageRoute(id: room.id).push(context);
              },
            );
          },
        );
      },
      error: (_, __) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error😢'),
            ],
          ),
        );
      },
      loading: () {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}
