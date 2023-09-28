import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:socket_io_demo/model/message.dart';
import 'package:socket_io_demo/model/room.dart';

part 'room.g.dart';

@riverpod
class RoomAsyncNotifier extends _$RoomAsyncNotifier {
  Future<Room> _fetchRoom(int id) async {
    try {
      final res = await http.get(Uri.parse('http://localhost:3000/room/$id'));
      if (res.statusCode == 200) {
        final body = json.decode(res.body);
        return Room.fromJson(body);
      } else {
        throw Exception('Failed to load room');
      }
    } catch (_) {
      throw Exception('Failed to load room');
    }
  }

  @override
  FutureOr<Room> build(int id) async {
    return await _fetchRoom(id);
  }

  void addMessage(Message message) {
    final stateValue = state.value;
    if (stateValue == null) return;

    state = AsyncValue.data(Room(
      id: stateValue.id,
      messages: [...stateValue.messages, message],
    ));
  }
}
