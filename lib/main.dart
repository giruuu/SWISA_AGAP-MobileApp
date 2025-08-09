import 'package:flutter/material.dart';
import 'loading_page.dart';

void main() => runApp(SwisaApp());

class SwisaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SwisaAGAP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoadingPage(),
    );
  }
}
