import 'package:flutter/material.dart';
import 'package:lya_to_do/Models/todo.dart';
import 'CardTodo.dart';

class SearchResult extends StatefulWidget {
  List<Todo> search = <Todo>[];
  SearchResult(this.search);

  @override
  _SearchResultState createState() => _SearchResultState(this.search);
}

class _SearchResultState extends State<SearchResult> {
  List<Todo> search;
  _SearchResultState(this.search);
  TextEditingController busqueda = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(title: Text("LYA To do APP")),
          body: Center(
            child: _list(),
          ),
        ),
      ],
    );
  }

  Widget _list() {
    return search.length != 0
        ? ListView.builder(
            itemCount: search.length,
            itemBuilder: (context, posicion) {
              return Dismissible(
                //direction: DismissDirection.startToEnd,
                key: ObjectKey(search[posicion]),
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
                child: CardTodo(search[posicion]),
                onDismissed: (direction) {
                  setState(() {
                    search.removeAt(posicion);
                  });
                },
              );
            },
          )
        : Container(
            child: Text("No se han encontrado actividades"),
          );
  }
}
