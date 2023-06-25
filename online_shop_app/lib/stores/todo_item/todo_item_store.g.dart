// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoItemStore on _TodoItemStore, Store {
  late final _$titleAtom = Atom(name: '_TodoItemStore.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$doneAtom = Atom(name: '_TodoItemStore.done', context: context);

  @override
  bool get done {
    _$doneAtom.reportRead();
    return super.done;
  }

  @override
  set done(bool value) {
    _$doneAtom.reportWrite(value, super.done, () {
      super.done = value;
    });
  }

  late final _$_TodoItemStoreActionController =
      ActionController(name: '_TodoItemStore', context: context);

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_TodoItemStoreActionController.startAction(
        name: '_TodoItemStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_TodoItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDone(bool value) {
    final _$actionInfo = _$_TodoItemStoreActionController.startAction(
        name: '_TodoItemStore.setDone');
    try {
      return super.setDone(value);
    } finally {
      _$_TodoItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
done: ${done}
    ''';
  }
}
