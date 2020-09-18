import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:website_app/web_view.dart';
import 'locator.dart';
import 'routes.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn to code',
      theme: ThemeData(
        primaryColor: Color(0xFF2a2a40),
      ),
      onGenerateRoute: Routes().onGenerateRoutes,
      initialRoute: '/',
      navigatorKey: locator<NavigationService>().navigatorKey,

    );
  }
}
