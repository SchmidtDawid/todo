import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> _todos;
  final Function _deleteFunction;

  TodoList(this._todos, this._deleteFunction);

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                child: ListTile(
                    leading: Text(_todos[index].status.toString()),
                    title: Text(_todos[index].title,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(_todos[index].date),
                      style: TextStyle(color: Colors.pink),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => _deleteFunction(_todos[index].id),
                    )),
              );
            },
            itemCount: _todos.length,
          ),
    );
  }
}
