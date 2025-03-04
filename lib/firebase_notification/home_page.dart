import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_button.dart';
import 'firebase_notification_setup.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body:  Center(
        child: CustomTextButton(
          width: 136,
          height: 40,
          borderRadius: 15,
          buttonType: ButtonType.outlined,
          borderColor: Colors.black,
          backgroundColor: Colors.blue,
          buttonText: 'Button Label',
          onPressed: () {
            log('Filled Button Clicked');
          },
        ),
      ),
    );
  }
}

//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   void getAppToken() async {
//      String? token = await FirebaseMessaging.instance.getToken();
//      log('==============================');
//      log('token: $token');
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getAppToken();
//   }
//   @override
//   Widget build(BuildContext context) {
//     setupNotifications(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Page'),
//       ),
//       body: const Center(
//         child: Text('Home Page', style: TextStyle(fontSize: 24),),
//       ),
//     );
//   }
// }
