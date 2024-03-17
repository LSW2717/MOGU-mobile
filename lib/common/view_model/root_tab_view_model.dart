import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabIndexProvider = StateNotifierProvider<TabIndexViewModel, int>((ref) {
  return TabIndexViewModel();
});

class TabIndexViewModel extends StateNotifier<int> {
  TabIndexViewModel() : super(0);

  void setIndex(int newIndex) => state = newIndex;
}
