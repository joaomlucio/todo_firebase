// ignore_for_file: avoid_init_to_null

import 'package:mobx/mobx.dart';
import 'package:todo_firebase/app/modules/home/models/todo_model.dart';

import 'package:todo_firebase/app/modules/home/repositories/todo_repository_interface.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final IToDoRepository repository;

  @observable
  ObservableStream<List<ToDoModel>>? list = null;

  HomeStoreBase({
    required this.repository,
  }) {
    getList();
  }

  @action
  getList() {
    list = repository.getToDos().asObservable();
  }
}
