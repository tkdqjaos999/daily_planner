import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/plan.dart';

class PlanItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final plan = Provider.of<Plan>(context);
    return Container(
      color: plan.isCompleted ? Colors.grey.withOpacity(0.3) : Colors.white,
      child: ListTile(
        leading: Text(plan.category),
        trailing: Checkbox(
            value: plan.isCompleted,
            onChanged: (_) {
              plan.toggleIsCompleted();
            },
          activeColor: Colors.black12,
          checkColor: Colors.red,
        ),
        title: Text(
          plan.title,
          style: TextStyle(
              decoration: plan.isCompleted ? TextDecoration.lineThrough : null),
        ),
        subtitle: Text(plan.description),
      ),
    );
  }
}
