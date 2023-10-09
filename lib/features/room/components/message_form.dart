import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessageForm extends StatefulWidget {
  const MessageForm({
    super.key,
    required this.socket,
    required this.roomId,
    required this.userId,
  });

  final IO.Socket socket;
  final int roomId;
  final int userId;

  @override
  State<MessageForm> createState() => _MessageFormState();
}

class _MessageFormState extends State<MessageForm> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool canSend = false;

  void textEditingListener() {
    setState(() {
      canSend = _controller.text.isNotEmpty;
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.socket.emit('send-message', {
        'roomId': widget.roomId,
        'userId': widget.userId,
        'body': _controller.text,
      });
      _controller.clear();
      _focusNode.unfocus();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(textEditingListener);
  }

  @override
  void dispose() {
    _controller.removeListener(textEditingListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
              focusNode: _focusNode,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            iconSize: 32,
            onPressed: canSend ? _sendMessage : null,
            icon: Icon(
              Icons.send,
              color: canSend ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
