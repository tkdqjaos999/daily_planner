import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/planner_detail_screen.dart';
import '../widgets/plan_item.dart';
import '../providers/dates.dart';

class PlannerInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dates = Provider.of<Dates>(context);

    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('데일리 플래너'),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    Navigator.of(context).pushNamed(PlannerDetailScreen.routeName);
                  },
                )
              ],
            ),
          ),
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: dates.today.plans.length,
              itemBuilder: (ctx, idx) {
                return ChangeNotifierProvider.value(
                  value: dates.today.plans[idx],
                  child: PlanItem());
              }),
          ),
        ],
      ),
    );
  }
}
