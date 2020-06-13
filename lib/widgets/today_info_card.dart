import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/dates.dart';

class TodayInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dates = Provider.of<Dates>(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: <Widget>[
                    Text('${DateFormat('yyyy.MM.dd').format(DateTime.now())}',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Spacer(),
                    Text('\"${dates.today.todaySentence}\"',
                      style: TextStyle(
                          fontSize: 14
                      ),
                    ),
                    Spacer(),
                    Text('D - DAY',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Container(
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: FittedBox(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.music_note),
                        SizedBox(width: 5,),
                        Text(dates.today.todayMusic,
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
