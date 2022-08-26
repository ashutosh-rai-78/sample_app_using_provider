import 'package:flutter/material.dart';
import 'package:sample_app_using_provider/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
