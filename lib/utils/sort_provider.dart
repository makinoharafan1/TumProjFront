import 'package:flutter/foundation.dart';

enum SortCriteria { labNumber, name, group, date }

class SortProvider with ChangeNotifier {
  SortCriteria _criteria = SortCriteria.date;
  bool _ascending = false;

  SortCriteria get criteria => _criteria;
  bool get ascending => _ascending;

  void setCriteria(SortCriteria criteria) {
    _criteria = criteria;
    notifyListeners();
  }

  void toggleSortOrder() {
    _ascending = !_ascending;
    notifyListeners();
  }
}
