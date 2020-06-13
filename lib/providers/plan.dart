import 'package:flutter/foundation.dart';

class Plan with ChangeNotifier {
  final String title;
  final String description;
  final String category;
  bool isCompleted;

  Plan({
    @required this.title,
    @required this.description,
    this.category = '',
    this.isCompleted = false,
  });

  void toggleIsCompleted() {
    isCompleted = !isCompleted;
    notifyListeners();
  }
}