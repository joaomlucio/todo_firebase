import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_firebase/app/modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_firebase/app/modules/home/repositories/todo_repository.dart';
import 'package:todo_firebase/app/modules/home/repositories/todo_repository_interface.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<IToDoRepository>((i) => ToDoRepository(firestore: i.get<FirebaseFirestore>())),
    Bind.lazySingleton((i) => HomeStore(repository: i.get<ToDoRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
