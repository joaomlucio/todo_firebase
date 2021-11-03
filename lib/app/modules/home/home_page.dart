import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_firebase/app/modules/home/home_store.dart';
import 'package:todo_firebase/app/modules/home/models/todo_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do'),
      ),
      body: Observer(
        builder: (context) {
          
          if (store.list!.hasError) {
            return Center(
                child: ElevatedButton(
              onPressed: store.getList,
              child: const Text('Error'),
            ));
          }
          
          if (store.list!.data == null) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          
          List<ToDoModel> list = store.list!.data;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              ToDoModel current = list[index];
              return ListTile(
                onTap: () {
                  _showDialog(current);
                },
                title: Text(current.title),
                leading: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: current.remove,
                  color: Colors.red,
                ),
                trailing: Checkbox(
                    onChanged: (value) {
                      current.status = value!;
                      current.save();
                    },
                    value: list[index].status),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  _showDialog([ToDoModel? model]) {
    model ??= ToDoModel();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(model!.title.isEmpty ? 'Adicionar' : 'Editar'),
            content: TextFormField(
              initialValue: model.title,
              onChanged: (value) => model!.title = value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite...',
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Modular.to.pop();
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () async {
                  await model!.save();
                  Modular.to.pop();
                },
                child: const Text('Salvar'),
              )
            ],
          );
        });
  }
}
