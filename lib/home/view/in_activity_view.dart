import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mogu_mobile/home/component/activity_card.dart';
import 'package:mogu_mobile/home/view_model/page_view_model.dart';

class InActivityView extends ConsumerWidget {
  const InActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(pageControllerProvider)[0];

    return Column(
      children: [
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification is ScrollUpdateNotification) {
                int pageIndex = (notification.metrics.pixels / 250.w).round();
                ref.read(pageControllerProvider.notifier).setPage(0, pageIndex);
              }
              return true;
            },
            child: ListView.builder(
              key: const PageStorageKey<String>('InActivity'),
              scrollDirection: Axis.horizontal,
              itemCount: 4, // 항목의 총 수
              itemBuilder: (context, index) {
                return ActivityCard();
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              height: 3.w,
              width: 16.w,
              decoration: BoxDecoration(
                color: currentPage == index ? const Color(0xFFB2C8FF) : Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
            );
          }), // Dot Indicator 생성
        ),
        SizedBox(height:20.w),
      ],
    );
  }
}
