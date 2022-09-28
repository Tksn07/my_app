import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InputForm extends StatefulWidget {
  final DocumentSnapshot? doc;
  // 引数の追加
  InputForm({super.key, this.doc});

  @override
  _MyInputFormState createState() => _MyInputFormState();
}

class _FormData {
  String title = '';
  bool isFinish = false;
}

class _MyInputFormState extends State<InputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DocumentReference _mainReference = FirebaseFirestore.instance.collection('todo').doc();
  final _FormData _data = _FormData();

  @override
  Widget build(BuildContext context) {
    bool deleteFlg = false;

    if (widget.doc != null) {
      final data = widget.doc?.data()! as Map<String, dynamic>;
      _data.title = data['title']!;
      _mainReference = FirebaseFirestore.instance.collection('todo').doc(widget.doc?.id);
      deleteFlg = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク入力'),
        actions: [
          !deleteFlg ? const Spacer() : IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              print("削除しました。");

              _mainReference.delete();
              Navigator.pop(context);
            }
          )
        ],
      ),
      body: SafeArea(
        child:
          Form(
            key: _formKey,
            child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.task),
                  hintText: 'タスク名',
                  labelText: 'title',
                ),
                onChanged: (String value) {
                  _data.title = value;
                },
                onSaved: (String? value) {
                  _data.title = value.toString();
                },
                validator: (value) {
                  return value == null || value.isEmpty ? 'タスク名を入力してください。' : null;
                },
                initialValue: _data.title,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            _mainReference.set({
              'title': _data.title,
              'isFinish': false
            });
            Navigator.pop(context);
          }
        }
      ),
    );
  }
}