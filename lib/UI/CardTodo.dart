import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lya_to_do/Models/todo.dart';

class CardTodo extends StatefulWidget {
  Todo todod;
  CardTodo(this.todod);

  @override
  _CardTodoState createState() => _CardTodoState();
}

class _CardTodoState extends State<CardTodo> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        setState(() {
          if (widget.todod.completed == 1) {
            widget.todod.completed = 0;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    const Text('Se ha marcado la tarea como no completada'),
                duration: const Duration(seconds: 2),
              ),
            );
          } else {
            widget.todod.completed = 1;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Se ha marcado la tarea como completada'),
                duration: const Duration(seconds: 2),
              ),
            );
          }
        });
      },
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              color: widget.todod.completed == 1
                  ? Colors.blueGrey[200]
                  : Colors.red[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(widget.todod.completed == 1
                          ? Icons.check
                          : Icons.cancel),
                    ),
                    Container(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.todod.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(),
                          Text(
                            widget.todod.description,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
