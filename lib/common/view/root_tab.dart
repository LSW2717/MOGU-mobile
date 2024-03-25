import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mogu_mobile/common/const/colors.dart';

import '../../category/view/category_view.dart';
import '../../chat/view/chat_view.dart';
import '../../home/view/home_view.dart';
import '../../mypage/view/mypage_view.dart';
import '../../search/view/search_view.dart';
import '../layout/default_layout.dart';
import '../view_model/root_tab_view_model.dart';

class RootTab extends ConsumerWidget {
  const RootTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(tabIndexProvider);
    return DefaultLayout(
      title: _getTitleFromTabIndex(currentIndex),
      needBackButton: false,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 103.w,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
          BottomNavigationBar(
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            selectedFontSize: 12.sp,
            unselectedFontSize: 12.sp,
            selectedLabelStyle: const TextStyle(
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w400,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w400,
            ),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              ref.read(tabIndexProvider.notifier).setIndex(index);
            },
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.w),
                  child: SvgPicture.asset(
                    'asset/svg/home.svg',
                    height: 22.w,
                    width: 22.w,
                  ),
                ),
                label: '홈',
                activeIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.w),
                  child: SvgPicture.asset(
                    'asset/svg/homeclick.svg',
                    height: 22.w,
                    width: 22.w,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 11.w),
                  child: SvgPicture.asset(
                    'asset/svg/category.svg',
                    height: 18.w,
                    width: 18.w,
                  ),
                ),
                label: '카테고리',
                activeIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 11.w),
                  child: SvgPicture.asset(
                    'asset/svg/categoryclick.svg',
                    height: 18.w,
                    width: 18.w,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.w),
                  child: SvgPicture.asset(
                    'asset/svg/search.svg',
                    height: 22.w,
                    width: 22.w,
                  ),
                ),
                label: '검색',
                activeIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.w),
                  child: SvgPicture.asset(
                    'asset/svg/searchclick.svg',
                    height: 22.w,
                    width: 22.w,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.w),
                  child: SvgPicture.asset(
                    'asset/svg/chat.svg',
                    height: 22.w,
                    width: 22.w,
                  ),
                ),
                label: '채팅',
                activeIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.w),
                  child: SvgPicture.asset(
                    'asset/svg/chatclick.svg',
                    height: 22.w,
                    width: 22.w,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.w),
                  child: SvgPicture.asset(
                    'asset/svg/profile.svg',
                    height: 26.w,
                    width: 26.w,
                  ),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.w),
                  child: SvgPicture.asset(
                    'asset/svg/profileclick.svg',
                    height: 26.w,
                    width: 26.w,
                  ),
                ),
                label: '프로필',
              ),
            ],
          ),
        ],
      ),
      child: IndexedStack(
        index: currentIndex,
        children: const [
          HomeView(),
          CategoryView(),
          SearchView(),
          ChatView(),
          MyPageView(),
        ],
      ),
    );
  }
}

String? _getTitleFromTabIndex(int index) {
  switch (index) {
    case 0:
      return null;
    case 1:
      return '카테고리';
    case 2:
      return '검색';
    case 3:
      return '채팅';
    case 4:
      return '프로필';
    default:
      return null;
  }
}