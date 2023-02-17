// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Alert _$$_AlertFromJson(Map<String, dynamic> json) => _$_Alert(
      uid: json['uid'] as String,
      message: json['message'] as String,
      read: json['read'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AlertToJson(_$_Alert instance) => <String, dynamic>{
      'uid': instance.uid,
      'message': instance.message,
      'read': instance.read,
    };
