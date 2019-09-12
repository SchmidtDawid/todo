import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> _todos;

  TodoList(this._todos);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
                child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(_todos[index].status.toString()),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(_todos[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text(
                      DateFormat.yMMMMd().format(_todos[index].date),
                      style: TextStyle(color: Colors.pink),
                    )
                  ],
                )
              ],
            ));
          },
          itemCount: _todos.length,
        ));
  }
}
