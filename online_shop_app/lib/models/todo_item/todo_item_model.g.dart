// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoItem _$TodoItemFromJson(Map<String, dynamic> json) => TodoItem(
      title: json['title'] as String,
      done: json['done'] as bool,
    );

Map<String, dynamic> _$TodoItemToJson(TodoItem instance) => <String, dynamic>{
      'title': instance.title,
      'done': instance.done,
    };
