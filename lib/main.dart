import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task2_internship/widgets/cubit.dart';
import 'package:task2_internship/widgets/learn_watch_in_cubit.dart';
import 'error/handling_native_error.dart';
import 'firebase_notification/home_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = ErrorHandler.handleFlutterError;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => MyCubit(),
        child: const LearnWatchInCubit2(),
      ),
    );
  }
}

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late bool? result = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  result = await context.pushNamed<bool>('screen2');
                  setState(() {

                  });
                  log(result.toString());
                },
                child: const Text("Next Screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: Text(result! ? "$result" : "Firebase Notification")),
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          context.pop(true); // مثال على قيمة يتم إرجاعها
          return true; // السماح بالرجوع
        }
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.pop(true);
                  },
                  child: const Text("pop Screen")),
            ],
          ),
        ),
      ),
    );
  }
}


class AppRouter {
  final routes = GoRouter(routes: [
    GoRoute(
      name: 'screen1',
      path: '/',
      builder: (context, state) => const Screen1(),
    ),
    GoRoute(
      name: 'screen2',
      path: '/Screen2',
      builder: (context, state) => const Screen2(),
    ),
  ]);
}