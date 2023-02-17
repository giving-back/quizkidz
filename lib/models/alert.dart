// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert.freezed.dart';
part 'alert.g.dart';

@Freezed()
class Alert with _$Alert {
  factory Alert({
    required final String uid,
    required final String message,
    @Default(false) bool read,
  }) = _Alert;

  factory Alert.fromJson(Map<String, Object?> json) => _$AlertFromJson(json);
}
