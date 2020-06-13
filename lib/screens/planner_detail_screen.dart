import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlannerDetailScreen extends StatelessWidget {
  static const routeName = '/planner-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('데일리 플래너'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.save), onPressed: () {})
          ],
        ),
        body: Column(
          children: <Widget>[
            InkWell(
                onTap: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.parse('2019-01-01'),
                    lastDate: DateTime.now().add(Duration(days: 7)));
                  },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                    height: 30,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Text(DateFormat('yyyy.MM.dd').format(DateTime.now()),
                    ),
                  ),
                )
            )
          ],
        )
    );
  }
}
