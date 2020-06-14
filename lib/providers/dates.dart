import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../models/date.dart';
import '../providers/plan.dart';

class Dates with ChangeNotifier {
  List<Date> _dates = [
    Date(
        date: DateTime.now(),
        plans: [
          Plan(title: '유데미 강의 245강', description: '유저 인증과 로그인'),
          Plan(title: '유데미 강의 246강', description: '유저 인증과 로그인'),
          Plan(title: '유데미 강의 247강', description: '유저 인증과 로그인'),
          Plan(title: '유데미 강의 248강', description: '유저 인증과 로그인'),
          Plan(title: '유데미 강의 249강', description: '유저 인증과 로그인'),

        ],
        todayMusic: '[슬기로운 의사생활 OST Part 6] 곽진언 - 시청 앞 지하철 역에서',
        todaySentence: '오늘은 더 힘차게!!!'),
  ];

  List<Date> get dates {
    return [..._dates];
  }

  Date get today {
    final today = DateTime.now();
    return _dates.firstWhere((date) =>
        (date.date.day == today.day) &&
        (date.date.month == today.month) &&
        (date.date.year == today.year));
  }
}
