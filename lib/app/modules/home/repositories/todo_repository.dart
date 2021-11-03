import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_firebase/app/modules/home/models/todo_model.dart';
import 'package:todo_firebase/app/modules/home/repositories/todo_repository_interface.dart';

class ToDoRepository implements IToDoRepository {
  FirebaseFirestore firestore;

  ToDoRepository({required this.firestore});

  @override
  Stream<List<ToDoModel>> getToDos() {
    return firestore.collection('todo').orderBy('position').snapshots().map((query) {
      return query.docs.map((doc) {
        return ToDoModel.fromMap(doc);
      }).toList();
    });
  }
}
