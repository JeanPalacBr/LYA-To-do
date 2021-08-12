import 'package:fab_menu_items/fab_menu_items.dart';
import 'package:flutter/material.dart';
import 'package:lya_to_do/Models/todo.dart';
import 'package:lya_to_do/UI/NewToDoDialog.dart';
import 'package:lya_to_do/UI/NewTodoDialogVarious.dart';
import 'CardTodo.dart';

class Home extends StatefulWidget {
  const Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todos = <Todo>[];
  TextEditingController busqueda = new TextEditingController();
  bool searching = false;
  bool encontrado = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: !searching
                ? Text("LYA To do APP")
                : TextField(
                    controller: busqueda,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                        hintText: "Busca actividades por descripción",
                        hintStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white),
                    onSubmitted: (busqueda) {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             SearchResult(busqueda)));
                    },
                  ),
            actions: <Widget>[
              Row(
                children: [
                  IconButton(
                      icon:
                          !searching ? Icon(Icons.search) : Icon(Icons.cancel),
                      onPressed: () {
                        setState(() {
                          this.searching = !this.searching;
                          busqueda.clear();
                        });
                      }),
                ],
              )
            ],
            backgroundColor: Colors.blue[400],
            elevation: 0,
          ),
          body: Center(
            child: _list(),
          ),
        ),
        Fabmenuitems(
          height: 160,
          weith: 180,
          animatedIcons: AnimatedIcons.add_event,
          fabcolor: Colors.blue.shade200,
          containercolor: Colors.white,
          childrens: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  print("holo");
                  _addTodo();
                },
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
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  print("holaaa");
                  _addTodoVarios();
                },
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
            ),
            Divider(),
          ],
        )
      ],
    );
  }

  Widget _list() {
    return todos.length != 0
        ? ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, posicion) {
              return Dismissible(
                //direction: DismissDirection.startToEnd,
                key: ObjectKey(todos[posicion]),
                background: Container(
                    color: Colors.red,
                    alignment: AlignmentDirectional.centerStart,
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.white),
                        Text(
                          "Borrar tarea",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
                secondaryBackground: Container(
                  color: Colors.green,
                  child: Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        Text(
                          " Editar tarea",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ),
                child: CardTodo(todos[posicion]),
                onDismissed: (direction) {
                  setState(() {
                    todos.removeAt(posicion);
                  });
                },
              );
            },
          )
        : Container(
            child: Text("No se han encontrado actividades"),
          );
  }

  void _addTodo() async {
    final todo = await showDialog<Todo>(
        context: context,
        builder: (BuildContext context) {
          return NewTodoDialog();
        });
    if (todo != null) {
      setState(() {
        todo.id = todos.length;
        todos.add(todo);
      });
    }
  }

  void _addTodoVarios() async {
    final todo = await showDialog<Todo>(
        context: context,
        builder: (BuildContext context) {
          return NewTodoDialogVarious();
        });
    if (todo != null) {
      setState(() {
        todo.id = todos.length;
        todos.add(todo);
      });
    }
  }

  void _editTodo() async {
    final todo = await showDialog<Todo>(
        context: context,
        builder: (BuildContext context) {
          return NewTodoDialog();
        });
    if (todo != null) {
      setState(() {
        todo.id = todos.length;
        todos.add(todo);
      });
    }
  }
}
