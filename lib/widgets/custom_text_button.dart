

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonType { filled, outlined, text }

class CustomTextButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final TextStyle? textStyle;
  final String buttonText;
  final ButtonType buttonType;
  final VoidCallback onPressed;

  const CustomTextButton({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.textStyle,
    required this.buttonText,
    this.buttonType = ButtonType.filled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(
          Size(
            (width ?? double.infinity).w,
            (height ?? 40).h,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          buttonType == ButtonType.filled ? backgroundColor ?? Colors.blue : Colors.transparent,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular((borderRadius ?? 8.0).r),
            side: buttonType == ButtonType.outlined
                ? BorderSide(
              color: borderColor ?? Colors.blue,
              width: (borderWidth ?? 1.0).w,
            )
                : BorderSide.none,
          ),
        ),
        overlayColor: WidgetStateProperty.all(
          buttonType == ButtonType.text ? Colors.grey.withOpacity(0.1) : null,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle ??
            TextStyle(
              fontSize: 16.sp,
              color: buttonType == ButtonType.filled
                  ? Colors.white
                  : borderColor ?? Colors.blue,
            ),
      ),
    );
  }
}
