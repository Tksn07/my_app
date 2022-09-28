import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'input_form.dart';


class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  _MyTodo createState() => _MyTodo();
}

class _MyTodo extends State<Todo> {
  /// Firestoreのデータベース定義
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: db.collection('todo').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.docs.map((doc) {
                  return _buildListItem(context, doc);
                }).toList(),
              );
             } else {
              return Container();
            }
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          print("新規作成ボタンを押しました");
          Navigator.push(
            context,
            MaterialPageRoute(
            settings: const RouteSettings(name: "/new"),
            builder: (BuildContext context) => InputForm(doc: null)
            ),
          );
        }
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;

    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.withOpacity(1.0),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: SizedBox(
          width: 500,
          height: 80,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(data['title']),
              TextButton(
                child: const Text('編集'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    settings: const RouteSettings(name: '/edit'),
                    builder: (BuildContext context) => InputForm(doc: doc)
                  ));
                },
              )
            ]
          ),
        ),
      ),
    );
  }
}