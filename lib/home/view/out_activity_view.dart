import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_model/page_view_model.dart';

class OutActivityView extends ConsumerWidget {
  const OutActivityView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(pageControllerProvider)[1];

    return Column(
      children: [
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification is ScrollUpdateNotification) {
                int pageIndex = (notification.metrics.pixels / 250.w).round();
                ref.read(pageControllerProvider.notifier).setPage(1, pageIndex);
              }
              return true;
            },
            child: ListView.builder(
              key: const PageStorageKey<String>('OutActivity'),
              scrollDirection: Axis.horizontal,
              itemCount: 4, // 항목의 총 수
              itemBuilder: (context, index) {
                return Container(
                  width: 250.w,
                  height: 250.w,
                  margin: EdgeInsets.only(left: 16.w, bottom: 12.w, top: 16.w),
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Colors.white, Colors.black],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
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
        SizedBox(height:28.w),
      ],
    );
  }
}
