import 'package:flutter/material.dart';

class CreateNewTodo extends StatefulWidget {
  final Function addFunction;

  CreateNewTodo(this.addFunction);

  @override
  _CreateNewTodoState createState() => _CreateNewTodoState();
}

class _CreateNewTodoState extends State<CreateNewTodo> {
  final titleController = TextEditingController();

  void addTodo() {
    final enteredTitle = titleController.text;

    if(enteredTitle.isEmpty){
      return;
    }

    widget.addFunction(titleController.text, 1);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text('text'),
            TextField(
              controller: titleController,
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Co chcesz zrobić?'),
              onSubmitted: (_) => addTodo(),
            ),
            FlatButton(
              child: Text(
                "Dodaj",
                style: TextStyle(color: Colors.pink),
              ),
              onPressed: addTodo,
            )
          ],
        ),
      ),
    );
  }
}