import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lya_to_do/Models/todo.dart';

class CardTodo extends StatelessWidget {
  Todo todod;
  CardTodo(this.todod);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: todod.completed == 1 ? Colors.blueGrey : Colors.yellow[200],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(todod.title),
              Text(todod.description),
            ],
          )
        ],
      ),
    );
  }
}
