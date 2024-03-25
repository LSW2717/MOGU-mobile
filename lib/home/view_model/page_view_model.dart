import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageControllerProvider =
    StateNotifierProvider<PageControllerViewModel, List<int>>((ref) {
  return PageControllerViewModel();
});

class PageControllerViewModel extends StateNotifier<List<int>> {
  PageControllerViewModel() : super([0, 0, 0]);

  void setPage(int listIndex, int pageIndex) {
    state = List.from(state)..[listIndex] = pageIndex;
  }
}
