import 'package:todo_firebase/app/modules/home/models/todo_model.dart';

abstract class IToDoRepository {
  Stream<List<ToDoModel>> getToDos();
}
