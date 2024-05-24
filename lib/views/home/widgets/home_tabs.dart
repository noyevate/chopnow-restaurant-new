// ignore_for_file: file_names


import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/common/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      child: Container(
        height: 60.h,
        width: width,
        decoration: BoxDecoration(
          
          color: Tcolor.placeHolder,
          borderRadius: BorderRadius.circular(60.r),
        ),
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: Tcolor.Secondary,
            borderRadius: BorderRadius.circular(60.r)
          ),
          labelPadding: EdgeInsets.zero,
          labelColor: Tcolor.Lightwhite,
          dividerColor: Colors.transparent,
          isScrollable: true,
          unselectedLabelColor: Tcolor.placeHolder,
          tabAlignment: TabAlignment.start,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: List.generate(orderList.length, (i) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: TabWidget(title: orderList[i]),
            );
          }),
        ),
      ),
    );
  }
}
