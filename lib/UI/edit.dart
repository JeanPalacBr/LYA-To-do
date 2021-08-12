import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lya_to_do/Models/todo.dart';
import 'package:lya_to_do/UI/NavDrawer.dart';
import 'package:lya_to_do/UI/home.dart';

class EditActivity extends StatefulWidget {
  Todo tarea = new Todo();
  EditActivity(this.tarea);
  @override
  EditActivitystate createState() => EditActivitystate(this.tarea);
}

class EditActivitystate extends State<EditActivity> {
  Todo tarea = new Todo();
  EditActivitystate(this.tarea);

  TextEditingController titulo;
  TextEditingController descripcionc;
  TextEditingController busqueda;
  bool searching = false;
  bool encontrado = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "LYA To Do App",
        home: Container(
            decoration: new BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.blue[200], Colors.blue[400]],
                    stops: [0.75, 0.5, 0.9],
                    begin: FractionalOffset.topRight,
                    end: FractionalOffset.bottomLeft)),
            child: Scaffold(
                drawer: NavDrawer(),
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
                            icon: !searching
                                ? Icon(Icons.search)
                                : Icon(Icons.cancel),
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
                backgroundColor: Colors.transparent,
                body: Builder(
                  builder: (context) => Form(
                      child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Editar actividad",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: containerText(
                              TextFormField(
                                initialValue: tarea.title,
                                autofocus: true,
                                controller: titulo,
                                keyboardType: TextInputType.emailAddress,
                                decoration: new InputDecoration(
                                  labelText: "Título",
                                  labelStyle: TextStyle(color: Colors.black),
                                  hintText: tarea.title,
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: containerText(
                              TextFormField(
                                initialValue: tarea.description,
                                autofocus: true,
                                controller: descripcionc,
                                decoration: new InputDecoration(
                                  labelText: tarea.description,
                                  labelStyle: TextStyle(color: Colors.black),
                                  hintText: tarea.description,
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.indigo[700]),
                                child: Text("Guardar cambios"),
                                onPressed: () {
                                  final todo = new Todo(
                                      id: tarea.id,
                                      title: titulo.value.text,
                                      description: descripcionc.value.text,
                                      completed: tarea.completed);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text("Los cambios han sido guardados"),
                                    duration: const Duration(seconds: 3),
                                  ));
                                  Navigator.of(context).pop(todo);
                                },
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                  child: Text("Atrás"))
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
                ))));
  }

  Widget containerText(Widget widg) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.indigo[700], width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        child: widg,
      ),
    );
  }
}
