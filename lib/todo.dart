/*---------- Add Start ----------*/
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


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
                  final data = doc.data()! as Map<String, dynamic>;
                  return _buildListItem(context, data['title']);
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
        }
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String title) {
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
          child: Center(
            child: Text(title)
          ),
        ),
      ),
    );
  }
}