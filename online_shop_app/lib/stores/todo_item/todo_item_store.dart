import 'package:mobx/mobx.dart';
part 'todo_item_store.g.dart';

class TodoItemStore = _TodoItemStore with _$TodoItemStore;

abstract class _TodoItemStore with Store {
  @observable
  String title = '';

  @observable
  bool done = false;

  @action
  void setTitle(String value) => title = value;

  @action
  void setDone(bool value) => done = value;
}
