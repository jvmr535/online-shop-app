// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoItem _$TodoItemFromJson(Map<String, dynamic> json) => TodoItem(
      key: json['key'] as String?,
      title: json['title'] as String,
      done: json['done'] as bool,
    )..timestamp = json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String);

Map<String, dynamic> _$TodoItemToJson(TodoItem instance) => <String, dynamic>{
      'key': instance.key,
      'title': instance.title,
      'done': instance.done,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
