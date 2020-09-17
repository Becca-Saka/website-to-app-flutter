import 'package:flutter/material.dart';
import 'package:website_app/web_view.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Website to App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebView(),

    );
  }
}
