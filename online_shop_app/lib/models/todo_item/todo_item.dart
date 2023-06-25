import 'package:json_annotation/json_annotation.dart';

part 'todo_item.g.dart';

@JsonSerializable()
class TodoItem {
  String title;
  bool done;

  TodoItem({required this.title, required this.done});

  factory TodoItem.fromJson(Map<String, dynamic> json) =>
      _$TodoItemFromJson(json);

  Map<String, dynamic> toJson() => _$TodoItemToJson(this);
}
