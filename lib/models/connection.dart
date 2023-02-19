// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection.freezed.dart';
part 'connection.g.dart';

@unfreezed
class Connection with _$Connection {
  factory Connection({
    required final String follower,
    required final String following,
  }) = _Connection;

  factory Connection.fromJson(Map<String, Object?> json) =>
      _$ConnectionFromJson(json);
}
