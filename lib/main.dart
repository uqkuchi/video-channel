import 'package:ayal_sahabe/pages/Home_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

// ignore: camel_case_types
class load_page extends StatelessWidget {
  const load_page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}
