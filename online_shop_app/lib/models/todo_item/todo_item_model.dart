import 'package:json_annotation/json_annotation.dart';

part 'todo_item_model.g.dart';

@JsonSerializable()
class TodoItem {
  String? key;
  String title;
  bool done;
  DateTime? timestamp = DateTime.now();

  TodoItem({
    this.key,
    required this.title,
    required this.done,
  });

  factory TodoItem.fromJson(Map<String, dynamic> json) =>
      _$TodoItemFromJson(json);

  Map<String, dynamic> toJson() => _$TodoItemToJson(this);
}
