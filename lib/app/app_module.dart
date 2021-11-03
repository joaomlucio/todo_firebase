import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_firebase/app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [Bind((i) => FirebaseFirestore.instance)];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
