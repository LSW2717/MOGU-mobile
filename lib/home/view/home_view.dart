import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mogu_mobile/common/const/colors.dart';
import 'package:mogu_mobile/common/const/typography.dart';
import 'package:mogu_mobile/home/view/community_view.dart';
import 'package:mogu_mobile/home/view/in_activity_view.dart';
import 'package:mogu_mobile/home/view/out_activity_view.dart';
import 'package:nested_scroll_view_plus/nested_scroll_view_plus.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollViewPlus(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(
                '지금 가장 인기있는',
                style: headerText1.copyWith(color: Colors.white),
              ),
              backgroundColor: primaryColor,
              scrolledUnderElevation: 0,
              stretch: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(30.w),
                child: Container(
                  width: 252.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    color: Colors.black, // 탭 배경색
                    borderRadius: BorderRadius.circular(30), // 탭의 둥근 모서리
                  ),
                  child: TabBar(
                    indicatorColor: Colors.white,
                    dividerColor: primaryColor,
                    dividerHeight: 0,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white, // 인디케이터 색상
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white.withOpacity(0.7),
                    labelStyle: headerText5,
                    unselectedLabelStyle: headerText6,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 0,
                    tabs: const [
                      Tab(text: '공모전'),
                      Tab(text: '대외활동'),
                      Tab(text: '커뮤니티'),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child:Container(
                height: 310.w,
                color: primaryColor,
                child: const TabBarView(
                  children: <Widget>[
                    InActivityView(),
                    OutActivityView(),
                    CommunityView(),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 28.w),
              Text('함께할 팀원을 기다리고 있어요', style: headerText1,),
              SizedBox(height: 13.w),
              Container(
                width: 358,
                height: 87,
                margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF1F3F9),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFE7EBF5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                width: 358,
                height: 87,
                margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFFF1F3F9),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFE7EBF5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                width: 358,
                height: 87,
                margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFFF1F3F9),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFE7EBF5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 28.w),
              Text('모구에서 구했어요!', style: headerText1,),
              SizedBox(height: 20.w),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 250,
                      height: 160,
                      margin: EdgeInsets.only(left: 16.w),
                      decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x33000000),
                            blurRadius: 8,
                            offset: Offset(2, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 160,
                      margin: EdgeInsets.only(left: 16.w),
                      decoration: ShapeDecoration(
                        color: Color(0xFF1556FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x33000000),
                            blurRadius: 8,
                            offset: Offset(2, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 160,
                      margin: EdgeInsets.only(left: 16.w),
                      decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x33000000),
                            blurRadius: 8,
                            offset: Offset(2, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 160,
                      margin: EdgeInsets.only(left: 16.w),
                      decoration: ShapeDecoration(
                        color: Color(0xFF1556FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x33000000),
                            blurRadius: 8,
                            offset: Offset(2, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.w),
            ],
          ),
        ),
      ),
    );
  }
}
