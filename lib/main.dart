import 'package:flutter/material.dart';
import 'package:shared/cached.dart';
import 'package:shared/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await CachedData.cachInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: HomePage(),
        ),
      ),
    );
  }
}


