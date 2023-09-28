import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

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

class RoomPage extends StatefulWidget {
  const RoomPage({super.key, required this.id});

  final int id;

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  final IO.Socket _socket = IO.io(
    "http://localhost:3000",
    IO.OptionBuilder()
        .setTransports(['websocket'])
        .disableAutoConnect()
        .build(),
  );

  @override
  void initState() {
    super.initState();

    _socket.onConnect((_) => print('connect'));
    _socket.onDisconnect((_) => print('disconnect'));
    _socket.connect();
  }

  @override
  void dispose() {
    _socket.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Room ${widget.id}'),
      ),
      body: const Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
