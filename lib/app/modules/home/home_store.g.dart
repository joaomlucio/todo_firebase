// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$listAtom = Atom(name: 'HomeStoreBase.list');

  @override
  ObservableStream<List<ToDoModel>>? get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableStream<List<ToDoModel>>? value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.getList');
    try {
      return super.getList();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
