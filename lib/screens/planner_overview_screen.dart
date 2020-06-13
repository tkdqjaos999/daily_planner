import 'package:dailyplanner/widgets/planner_info_card.dart';
import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/today_info_card.dart';

class PlannerOverviewScreen extends StatelessWidget {
  static const route = '/planner-overview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('데일리 플래너'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.person), onPressed: (){})
        ],
        elevation: 0,
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TodayInfoCard(),
            PlannerInfoCard(),
          ],
        ),
      ),
    );
  }
}
