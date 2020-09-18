import 'dart:async';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'locator.dart';

class DashboardViewModel extends  BaseViewModel{
 final flutterWebViewPlugin = FlutterWebviewPlugin();
 final String assetName = 'assets/images/fcc_primary_large.svg';
 final baseUrl = 'https://freecodecamp.org';
 NavigationService navigationService = locator<NavigationService>();
 String searchText= '';
 bool isSwitched = false;
 double progress=0.0;
 

 StreamSubscription<double> _onProgressChanged;

 trackProgress(){
   _onProgressChanged = flutterWebViewPlugin.onProgressChanged
   .listen((double newProgress) {
    progress = newProgress;
    notifyListeners();
    print(progress);
   
 });

 }

 gotoWebPage(String url){
  navigationService.navigateTo('/webView', arguments: url);
  trackProgress();

 }
 search(String value){
  searchText = '$baseUrl/news/search/?query=${Uri.encodeComponent(value)}';
  print(searchText);
  notifyListeners();
 }
 updateIsSwitched(){
  isSwitched = !isSwitched;
  notifyListeners();
 }

 Future<bool> goback() async{
    bool cangoback = await flutterWebViewPlugin.canGoBack();
    if(cangoback == true){
      await flutterWebViewPlugin.goBack();
    }else{
      await flutterWebViewPlugin.close();
      navigationService.back();
    }
    return true;
 }

}