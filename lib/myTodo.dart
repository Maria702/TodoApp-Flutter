import 'package:flutter/material.dart';
// import 'package:hover_effect/hover_effect.dart';

// ignore: camel_case_types
class myTodo extends StatefulWidget {
  @override
  _myTodoState createState() => _myTodoState();
}

// ignore: camel_case_types
class _myTodoState extends State<myTodo> {
  var output = "";
  List<dynamic> lst = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Center(child: Text("To-Do App by Maria")),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              color: Colors.grey[200],
              margin: EdgeInsets.only(top: 10),
              child: ListTile(
                title: Center(child: Text("${lst[index]}")),
                trailing: Container(
                  width: 50,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Edit Item"),
                                    content: TextField(
                                      onChanged: (value) {
                                        output = value;
                                      },
                                    ),
                                    actions: [
                                      // edit item
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              lst.replaceRange(
                                                  index, index + 1, {output});
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Edit")),
                                      // cancel edit item
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              lst.remove(output);
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("cancel")),
                                    ],
                                  );
                                });
                          },
                          child: Icon(Icons.edit)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              lst.removeAt(index);
                            });
                          },
                          child: Icon(Icons.delete)),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add a task to your List"),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    // add item
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            lst.add(output);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("Add")),
                    // cancel item
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          lst.remove(output);
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("cancel"),
                    ),
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.pink,
          size: 30,
        ),
      ),
    );
  }
}
