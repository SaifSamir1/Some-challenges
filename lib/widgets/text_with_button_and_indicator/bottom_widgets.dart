import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/model/page_model.dart';
import 'indicator.dart';
class BottomWidgets extends StatelessWidget {
  const BottomWidgets({
    super.key,
    required this.currentIndex,
    required this.controller,
  });

  final int currentIndex;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Indicator(currentIndex: currentIndex),
        SizedBox(height: 15.h.clamp(13, 17)),
        GestureDetector(
          onTap: () {
            if (currentIndex < 2) {
              controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              // Navigate to the next screen
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: currentIndex < 2 ? 60.w : 150.w,
            height: 60.w,
            padding: currentIndex < 2 ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: PageModel.pagesDetails[currentIndex].color,
              borderRadius: BorderRadius.circular(currentIndex < 2 ? 30.r : 25.r),
            ),
            child: currentIndex < 2
                ? const Icon(Icons.arrow_forward, color: Colors.white)
                : FittedBox( // يضمن أن المحتوى يتناسب مع المساحة
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  const Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
