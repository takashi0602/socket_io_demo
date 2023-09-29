import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_demo/features/room/api/room.dart';
import 'package:socket_io_demo/features/room/components/message_form.dart';
import 'package:socket_io_demo/model/message.dart';

class MessageContent extends ConsumerStatefulWidget {
  const MessageContent({super.key, required this.roomId});

  final int roomId;

  @override
  ConsumerState<MessageContent> createState() => _MessageContentState();
}

class _MessageContentState extends ConsumerState<MessageContent> {
  late final IO.Socket _socket;

  @override
  void initState() {
    super.initState();

    _socket = IO.io(
      "http://localhost:3000",
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );

    // 接続時の処理
    _socket.onConnect((_) {
      debugPrint('connect');
      _socket.emit('join-room', widget.roomId);
    });

    // ルームに参加した処理
    _socket.on('joined-room', (_) {
      debugPrint('joined-room');
    });

    // メッセージを受け取った時の処理
    _socket.on('receive-message', (res) {
      final message = Message.fromJson(res);
      ref
          .read(roomAsyncNotifierProvider(widget.roomId).notifier)
          .addMessage(message);
    });

    // 切断時の処理
    _socket.onDisconnect((_) => debugPrint('disconnect'));
    _socket.connect();
  }

  @override
  void dispose() {
    _socket.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 本来はAPIから取得する
    final userId =
        int.parse(const String.fromEnvironment('USER_ID', defaultValue: '1'));
    final roomAsyncNotifier =
        ref.watch(roomAsyncNotifierProvider(widget.roomId));

    return roomAsyncNotifier.when(data: (room) {
      final messages = room.messages;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: message.userId == userId
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (message.userId != userId) ...[
                        const Icon(
                          Icons.account_circle_outlined,
                          size: 24,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                      ],
                      Flexible(
                        child: Text(
                          message.body,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (message.userId == userId) ...[
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.account_circle_outlined,
                          size: 24,
                          color: Colors.black,
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: MessageForm(
              socket: _socket,
              roomId: widget.roomId,
              userId: userId,
            ),
          ),
          const SizedBox(height: 24),
        ],
      );
    }, error: (_, __) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error😢'),
          ],
        ),
      );
    }, loading: () {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        ),
      );
    });
  }
}
