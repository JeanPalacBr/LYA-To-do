import 'package:fab_menu_items/fab_menu_items.dart';
import 'package:flutter/material.dart';
import 'package:lya_to_do/Models/todo.dart';

import 'CardTodo.dart';

class Home extends StatefulWidget {
  const Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todos = <Todo>[];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue.shade200,
            title: Text("LYA To Do APP"),
          ),
          body: Center(
            child: _list(),
          ),
        ),
        Fabmenuitems(
          height: 160,
          weith: 150,
          animatedIcons: AnimatedIcons.add_event,
          fabcolor: Colors.blue.shade200,
          containercolor: Colors.white,
          childrens: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.plus_one,
                    size: 24,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    "Agregar una tarea",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ))
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    "Agregar varias tareas",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ))
                ],
              ),
            ),
            Divider(),
          ],
        )
      ],
    );
  }

  Widget _list() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, posicion) {
        var element = todos[posicion];
        return Dismissible(
          key: ObjectKey(todos[posicion]),
          background: Container(
              color: Colors.red,
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "Deleting",
                style: TextStyle(color: Colors.white),
              )),
          //Icon(Icons.delete, color: Colors.white)),
          child: CardTodo(todos[posicion]),

          onDismissed: (direction) {
            setState(() {
              todos.removeAt(posicion);
            });
          },
        );
      },
    );
  }

  Widget _item(Todo element, int posicion) {
    return Text('$posicion');
  }
}
