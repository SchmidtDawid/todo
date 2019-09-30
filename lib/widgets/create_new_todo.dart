import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateNewTodo extends StatefulWidget {
  final Function addFunction;

  CreateNewTodo(this.addFunction);

  @override
  _CreateNewTodoState createState() => _CreateNewTodoState();
}

class _CreateNewTodoState extends State<CreateNewTodo> {
  final titleController = TextEditingController();
  DateTime _selectedDate;

  void _addTodo() {
    final enteredTitle = titleController.text;

    if (enteredTitle.isEmpty || _selectedDate == null) {
      return;
    }

    widget.addFunction(titleController.text, 1, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            lastDate: DateTime.now().subtract(Duration(days: -1000)),
            firstDate: DateTime(1970))
        .then((date) {
          if(date == null){return;}
          setState(() {
            _selectedDate = date;
          });
        });
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
              onSubmitted: (_) => _addTodo(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(child: Text( _selectedDate == null ? 'Nie wybrano daty' :  DateFormat.MMMMEEEEd().format(_selectedDate))),
                  FlatButton(
                    child: Text('Wybierz datę'),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text("Dodaj"),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).buttonColor,
              onPressed: _addTodo,
            )
          ],
        ),
      ),
    );
  }
}
