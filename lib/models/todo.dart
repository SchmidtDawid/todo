import 'package:flutter/foundation.dart';

class Todo {
  final DateTime id;
  final String title;
  final int status;
  final DateTime date;

  Todo(
    {
      @required this.id,
      @required this.title,
      @required this.status,
      @required this.date
    }
  );
}