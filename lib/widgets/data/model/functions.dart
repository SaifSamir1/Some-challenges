import 'package:flutter/material.dart';


Widget getProperIcon(int currentIndex) => currentIndex != 2
    ? const Icon(
        Icons.navigate_next,
        key: ValueKey('next_icon'),
        color: Colors.white,
        size: 55,
      )
    : const Row(
      children: [
        Text('Get Started', style: TextStyle(fontSize: 20,color: Colors.white),),
        Icon(
            Icons.navigate_next,
            key: ValueKey('done_icon'),
            color: Colors.white,
            size: 55,
          ),
      ],
    );

void navigationViaButton(
    int currentIndex,
    PageController controller,
    BuildContext context
)async {
  if (currentIndex != 2)
    {
      controller.nextPage(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOutCirc,
      );
    } else  {

  }
}
