import 'package:mobx/mobx.dart';
import 'package:todo_list_app/models/todo_item/todo_item_model.dart';
import 'package:todo_list_app/services/todo_list_service/todo_list_service.dart';
part 'todo_item_store.g.dart';

class TodoItemStore = _TodoItemStore with _$TodoItemStore;

abstract class _TodoItemStore with Store {
  TodoListService todoListService = TodoListService();

  @observable
  String title = '';

  @observable
  bool done = false;

  DateTime? timestamp = DateTime.now();

  @observable
  List<TodoItem> todoList = [];

  @action
  void setTitle(String value) => title = value;

  @action
  void setDone(bool value) => done = value;

  @action
  Future<void> refetch() async {
    todoList = await todoListService.getTodoList();
  }
}
