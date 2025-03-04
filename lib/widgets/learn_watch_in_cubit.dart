



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(
    BlocProvider(
      create: (context) => MyCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LearnWatchInCubit(),
    );
  }
}

class LearnWatchInCubit extends StatelessWidget {
  const LearnWatchInCubit({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Rebuild");
    return Scaffold(
      appBar: AppBar(title: const Text("Watch vs Read Test")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(height: 50, color: Colors.red), // عنصر ثابت
            // هنا المشكلة، الـ Column كله هيعمل Rebuild لما النص يتغير
            Text(context.watch<MyCubit>().state, style: const TextStyle(fontSize: 20)),
            Container(height: 50, color: Colors.blue), // عنصر ثابت
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<MyCubit>().changeText(),
              child: const Text("غيّر النص"),
            ),
          ],
        ),
      ),
    );
  }
}


class LearnWatchInCubit2 extends StatelessWidget {
  const LearnWatchInCubit2({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Rebuild");
    return Scaffold(
      appBar: AppBar(title: const Text("Watch vs Read Test")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(height: 50, color: Colors.red), // عنصر ثابت
            Builder(
              builder: (context) => Text(context.watch<MyCubit>().state, style: const TextStyle(fontSize: 20)),
            ),
            Container(height: 50, color: Colors.blue), // عنصر ثابت
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<MyCubit>().changeText(),
              child: const Text("غيّر النص"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCubit extends Cubit<String> {
  MyCubit() : super("نص البداية");

  void changeText() {
    emit(state == "نص البداية" ? "نص متغير" : "نص البداية");
  }
}