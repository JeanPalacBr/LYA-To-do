import 'package:fab_menu_items/fab_menu_items.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            child: Text("LYA To Do APP"),
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
}
