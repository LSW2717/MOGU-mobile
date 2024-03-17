import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mogu_mobile/common/const/colors.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  final bool needBackButton;
  final Widget? action;
  final bool extendBodyBehindAppBar;

  const DefaultLayout({
    this.backgroundColor,
    required this.child,
    this.title,
    this.bottomNavigationBar,
    this.needBackButton = false,
    this.action,
    this.extendBodyBehindAppBar = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      backgroundColor: Colors.white,
      appBar: renderAppBar(context),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  AppBar? renderAppBar(BuildContext context) {
    if (title == null) {
      return AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: primaryColor,
        toolbarHeight: 64.w,
        automaticallyImplyLeading: true,
        title: Image.asset(
          'asset/img/mogutitle.png',
          width: 105.w,
          height: 24.w,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.bell_fill,color: Colors.white,),
          ),
        ],
      );
    } else {
      return AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: primaryColor,
        toolbarHeight: 64.w,
        automaticallyImplyLeading: false,
        leading: Row(
          children: [
            needBackButton
                ? Padding(
                    padding: EdgeInsets.only(
                      left: 0.w,
                    ),
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: SvgPicture.asset(
                        'asset/svg/back.svg',
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        title: Text(
          title!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: 'SFPro',
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: action != null
            ? [
                action!,
              ]
            : null,
      );
    }
  }
}
