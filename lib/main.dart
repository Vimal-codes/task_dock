import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_dock_animation/view/dock_view.dart';
import 'package:task_dock_animation/viewmodel/dock_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DockViewModel(),
      child: const MaterialApp(
        home: Scaffold(
          body: Center(
            child: DockView(),
          ),
        ),
      ),
    );
  }
}