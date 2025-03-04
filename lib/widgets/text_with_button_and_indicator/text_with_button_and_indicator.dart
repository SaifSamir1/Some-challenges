import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2_internship/widgets/text_with_button_and_indicator/text_with_animation.dart';

import 'bottom_widgets.dart';
part 'main_text.dart';


class TextWithButtonAndIndicator extends StatelessWidget {
  const TextWithButtonAndIndicator({
    required this.currentIndex,
    required this.controller,
    super.key,
  });

  final int currentIndex;
  final PageController controller;



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextWithAnimation(
            currentIndex: currentIndex,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ).copyWith(
            bottom: 24,
          ),
          child: BottomWidgets(
            controller: controller,
            currentIndex: currentIndex,
          ),
        ),
      ],
    );
  }
}

