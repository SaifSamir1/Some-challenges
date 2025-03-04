import 'package:flutter/material.dart';

import '../data/model/page_model.dart';
import 'animations.dart';


class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: AnimatedContainer(
            curve: Curves.ease,
            duration: AppAnimations.defaultDuration,
            width: index == currentIndex ? 30 : 10,
            height: 10,
            decoration: BoxDecoration(
              color: PageModel.pagesDetails[currentIndex].color,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
