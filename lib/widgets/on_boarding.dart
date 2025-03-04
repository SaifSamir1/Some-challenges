import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2_internship/widgets/text_with_button_and_indicator/text_with_button_and_indicator.dart';





class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Welcome!',
      'description': 'Discover amazing features with us.',
      'image': 'assets/images/Leonardo_Phoenix_Design_a_clean_and_professional_interface_for_2.jpg',
    },
    {
      'title': 'Stay Connected',
      'description': 'Always stay in touch with your loved ones.',
      'image': 'assets/images/Leonardo_Phoenix_Design_a_modern_and_userfriendly_mobile_scree_1.jpg',
    },
    {
      'title': 'Achieve Goals',
      'description': 'We help you reach your dreams.',
      'image': 'assets/images/localization.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                final data = _onboardingData[index];
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = _pageController.page! - index;
                      value = (1 - (value.abs() * 0.3)).clamp(0.7, 1.0);
                    }
                    return Transform.scale(
                      scale: value,
                      child: Transform.translate(
                        offset: Offset(0, 50 * (1 - value)),
                        child: child,
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        ),
                        image: DecorationImage(
                          image: AssetImage(data['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: size.height * 0.7,
                      width: size.height * 0.5,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 15.h.clamp(13, 17),
          ),
          Expanded(
            flex: 3,
            child: TextWithButtonAndIndicator(
              controller: _pageController,
              currentIndex: _currentPage,
            ),
          )
        ],
      ),
    );
  }
}
