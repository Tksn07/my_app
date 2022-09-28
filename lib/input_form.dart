import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  _MyInputFormState createState() => _MyInputFormState();
}

class _FormData {
  String title = '';
  bool isFinish = false;
}

class _MyInputFormState extends State<InputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final DocumentReference _mainReference = FirebaseFirestore.instance.collection('todo').doc();
  final _FormData _data = _FormData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク入力'),
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