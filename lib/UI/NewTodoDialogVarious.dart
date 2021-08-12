import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lya_to_do/Models/todo.dart';
import 'package:lya_to_do/Services/APIConnection.dart';

class NewTodoDialogVarious extends StatefulWidget {
  @override
  _NewTodoDialogVariousState createState() => _NewTodoDialogVariousState();
}

class _NewTodoDialogVariousState extends State<NewTodoDialogVarious> {
  final controllerAmount = new TextEditingController();
  List<Todo> cats = <Todo>[];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: AlertDialog(
        backgroundColor: Colors.blue.shade50,
        title: Text(
          "Agregar nueva tarea",
          style:
              TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
        ),
        content: Column(
          children: <Widget>[
            new TextField(
              autofocus: true,
              controller: controllerAmount,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  labelText: 'Cantidad de tareas a agregar'),
            ),
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
                getFacts(controllerAmount.value.text).then((value) {
                  print("value");
                  for (var i = 0; i < value.length; i++) {
                    final todo = new Todo(
                        completed: 0,
                        description: value[i].fact,
                        title: "Actividad" + i.toString());
                  }
                });
                final todo = new Todo(completed: 0);
                controllerAmount.clear();

                Navigator.of(context).pop(todo);
              })
        ],
      ),
    );
  }
}
