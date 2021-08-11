import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lya_to_do/Models/todo.dart';

class NewTodoDialog extends StatefulWidget {
  @override
  _NewTodoDialogState createState() => _NewTodoDialogState();
}

class _NewTodoDialogState extends State<NewTodoDialog> {
  final controllerAmount = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue.shade50,
      title: Text(
        "Agregar nueva tarea",
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
      ),
      content: Column(
        children: <Widget>[
          Expanded(
              child: new TextField(
            autofocus: true,
            controller: controllerAmount,
            keyboardType: TextInputType.number,
            decoration:
                new InputDecoration(labelText: 'Cantidad de tareas a agregar'),
          )),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
            child: Text('Crear'),
            onPressed: () {
              final todo = new Todo(completed: 0);
              controllerAmount.clear();

              Navigator.of(context).pop(todo);
            })
      ],
    );
  }
}
