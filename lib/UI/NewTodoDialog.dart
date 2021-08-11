import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lya_to_do/Models/todo.dart';

class NewTodoDialog extends StatefulWidget {
  @override
  _NewTodoDialogState createState() => _NewTodoDialogState();
}

class _NewTodoDialogState extends State<NewTodoDialog> {
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();
  String controllerType = "DEFAULT";
  String sel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue.shade50,
      title: Text(
        "Agregar Quehacer",
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
      ),
      content: Column(
        children: <Widget>[
          Expanded(
              child: new TextField(
            autofocus: true,
            controller: controllerTitle,
            decoration: new InputDecoration(labelText: 'Título'),
          )),
          Expanded(
              child: new TextField(
            controller: controllerBody,
            decoration: new InputDecoration(labelText: 'Descripción'),
          )),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
            child: Text('Agregar'),
            onPressed: () {
              final todo = new Todo(
                  title: controllerTitle.value.text,
                  description: controllerBody.value.text,
                  completed: 0);
              controllerTitle.clear();
              controllerBody.clear();

              Navigator.of(context).pop(todo);
            })
      ],
    );
  }
}
