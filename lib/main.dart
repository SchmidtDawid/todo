import 'package:flutter/material.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/widgets/weekView.dart';

import 'widgets/create_new_todo.dart';
import 'widgets/todo_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todo> _userTodos = [
    Todo(id: 1, title: 'Programować', status: 1, date: DateTime.now()),
    Todo(id: 2, title: 'Posprzątać', status: 1, date: DateTime.now())
  ];
  
  List<Todo> get _recentTodos {
    return _userTodos.where((todo){
      return todo.date.isAfter(
        DateTime.now().subtract(Duration(days: 7))
      );
    }).toList();
  }

  void _addNewTodo(String passedTitle, int passedStatus) {
    final newTodo = Todo(
      title: passedTitle,
      status: passedStatus,
      date: DateTime.now(),
      id: 1,
    );

    setState(() {
      _userTodos.add(newTodo);
    });
  }

  void _startAddNewTodo(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return CreateNewTodo(_addNewTodo);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTodo(context),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            WeekView(_recentTodos),
            TodoList(_userTodos)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTodo(context),
      ),
    );
  }
}
