import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socket_io_demo/features/room/components/message_content.dart';

part 'room_page.g.dart';

@TypedGoRoute<RoomPageRoute>(
  path: '/room/:id',
)
class RoomPageRoute extends GoRouteData {
  const RoomPageRoute({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) => RoomPage(id: id);
}

class RoomPage extends StatelessWidget {
  const RoomPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Room $id'),
      ),
      body: MessageContent(roomId: id),
    );
  }
}
