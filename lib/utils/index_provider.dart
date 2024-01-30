import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageIndexProvider with ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}

void changePage({required int index, required BuildContext context}) {
  Provider.of<PageIndexProvider>(context, listen: false).pageIndex = index;
}
