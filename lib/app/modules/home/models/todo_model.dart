import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ToDoModel {
  FirebaseFirestore firestore = Modular.get<FirebaseFirestore>();

  DocumentReference? reference;

  bool status;

  String title;

  ToDoModel({
    this.reference,
    this.status = false,
    this.title = '',
  });

  save() async {
    if (reference == null) {
      int lastPosition = (await firestore
              .collection('todo_lastPosition')
              .doc("PH6vYNPowqS26M49Z7uj")
              .get())
          .data()!['position'];
      var data = toMap();
      data.putIfAbsent('position', () => lastPosition + 1);
      reference = await firestore.collection('todo').add(data);
      await firestore
          .collection('todo_lastPosition')
          .doc("PH6vYNPowqS26M49Z7uj")
          .update({'position': lastPosition + 1});
    } else {
      reference!.update(toMap());
    }
  }

  remove() async {
    reference!.delete();
  }

  factory ToDoModel.fromMap(DocumentSnapshot doc) {
    return ToDoModel(
      reference: doc.reference,
      status: doc['status'],
      title: doc['title'],
    );
  }

  factory ToDoModel.fromJson(String source) =>
      ToDoModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'title': title,
    };
  }

  String toJson() => json.encode(toMap());
}
