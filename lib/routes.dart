import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:website_app/dashboard.dart';
import 'package:website_app/web_view.dart';

class Routes{
  Route<dynamic> onGenerateRoutes(RouteSettings settings){
    switch(settings.name){
      case'/':
        return CupertinoPageRoute(
          builder: (context)=> DashBoard(),
          settings: settings
        );
      case'/webView':
        final selectedUrl = settings.arguments;
        return CupertinoPageRoute(
          builder: (context)=> WebView(selectedUrl),
          settings: settings
        );
    }
  }
}