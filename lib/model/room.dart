import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:socket_io_demo/model/message.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  const factory Room({
    required int id,
    required List<Message> messages,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
