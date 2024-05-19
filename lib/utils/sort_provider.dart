import 'package:flutter/foundation.dart';

enum SortCriteria { labNumber, name, group, date }

class SortProvider with ChangeNotifier {
  SortCriteria _criteria = SortCriteria.labNumber;

  SortCriteria get criteria => _criteria;

  void setCriteria(SortCriteria criteria) {
    _criteria = criteria;
    notifyListeners();
  }
}
