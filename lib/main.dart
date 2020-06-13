import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/planner_overview_screen.dart';
import './screens/planner_detail_screen.dart';
import './providers/dates.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Dates(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white
        ),
        debugShowCheckedModeBanner: false,
        home: PlannerOverviewScreen(),
        routes: {
          PlannerOverviewScreen.route: (ctx) => PlannerOverviewScreen(),
          PlannerDetailScreen.routeName: (ctx) => PlannerDetailScreen()
        },
      ),
    );
  }
}
