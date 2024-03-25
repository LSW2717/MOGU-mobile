import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
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
        image: const DecorationImage(
          image: NetworkImage(
              'https://s3-alpha-sig.figma.com/img/69ae/edca/25512bee13a44b50608dccc02d3fb091?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hCgy7zAf1poUc8ZNuu9kXsXCamVqgtbL2o1yxgDjm4v5bPWKNOlyOZk8jPcYiGKFK-cP2O9G3itM3p6Q6DpOoBf~WVL6JA0brdynOsP~tgJvU16016Qo9wufEs1byXEllHB3byQuHM3phmfmwxY7Y~~FUKt6uoLhi18ckV4C9av9k6XTWEETHB5gTldH9Gf8ShHug0JoRgHoiF2Z2OLbaQJL0DsVef0Lsy1zXrvx175SDr5hQAQweEjhbZoar-pIiGIMaKkRXupdMGX30oYEZC9QEj9vzCQ9xTycT~C1AtBPX8QFAZvHh7AM5bQVzpckgrYrid5bkqaBL8RR07oXxg__'),
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Container(
            width: 250.w,
            height: 74.w,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
