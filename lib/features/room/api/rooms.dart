import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:socket_io_demo/model/room.dart';

part 'rooms.g.dart';

@riverpod
class RoomsAsyncNotifier extends _$RoomsAsyncNotifier {
  Future<List<Room>> _fetchRooms() async {
    try {
      final res = await http.get(Uri.parse('http://localhost:3000/rooms'));
      if (res.statusCode == 200) {
        final List<dynamic> body = json.decode(res.body);
        return body.map((room) => Room.fromJson(room)).toList();
      } else {
        throw Exception('Failed to load rooms');
      }
    } catch (_) {
      throw Exception('Failed to load rooms');
    }
  }

  @override
  FutureOr<List<Room>> build() async {
    return await _fetchRooms();
  }
}
