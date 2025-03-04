import 'package:flutter/material.dart';

class PageModel {
  final String title;
  final String subTitle;
  final Color color;

  PageModel({
    required this.title,
    required this.subTitle,
    required this.color,
  });

  static List<PageModel> pagesDetails = [
    PageModel(
      title: 'Seamless Data Storage',
      subTitle:
          'Your data is securely stored both locally and on the cloud, ensuring accessibility anytime, anywhere',
      color: Colors.black54,
    ),
    PageModel(
      title: 'Multilingual Support',
      subTitle:
          'Easily switch between English and Arabic for a personalized user experience',
      color: Colors.red.shade500,
    ),
    PageModel(
      title: 'Convert Data to PDF',
      subTitle:
          'Effortlessly generate PDF files from your data, ready to share or save for future use',
      color: Colors.green.shade800,
    ),
  ];
}
