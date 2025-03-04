part of 'text_with_button_and_indicator.dart';

class MainText extends StatelessWidget {
  const MainText({super.key,
     required this.currentTitle, required this.currentSubTitle,
  });

  final String currentTitle;
  final String currentSubTitle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:5.0),
            child: Text(
              currentTitle,
              style: TextStyle(
                fontSize: 20.sp.clamp(15, 24),
                fontWeight: FontWeight.w700,
                color: Colors.black.withOpacity(.8),
              )
            ),
          ),
          SizedBox(
            height: 10.h.clamp(10, 18),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25.w,
            ),
            child: Text(
              currentSubTitle,
              style:TextStyle(
                fontSize: 14.sp.clamp(12, 16),
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(.6),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
