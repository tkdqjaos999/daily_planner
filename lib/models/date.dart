import 'package:flutter/foundation.dart';

import '../providers/plan.dart';

class Date {
  final DateTime date;
  final List<Plan> plans;
  final String todayMusic;
  final String todaySentence;

  Date({
    @required this.date,
    @required this.plans,
    @required this.todayMusic,
    @required this.todaySentence,
  });
}