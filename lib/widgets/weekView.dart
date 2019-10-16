import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/widgets/weekView_bar.dart';

class WeekView extends StatelessWidget {
  final List<Todo> recentTodos;

  WeekView(this.recentTodos);

  List<Map<String, Object>> get groupedTodosValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: -index));
      int totalSum = 0;

      for (var i = 0; i < recentTodos.length; i++) {
        if (recentTodos[i].date.day == weekDay.day &&
            recentTodos[i].date.month == weekDay.month &&
            recentTodos[i].date.year == weekDay.year) {
          totalSum++;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {'day': DateFormat.E().format(weekDay), 'count': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTodosValues);
    return Container(
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTodosValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: WeekViewBar(
                  data['day'], data['count']
                )
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
