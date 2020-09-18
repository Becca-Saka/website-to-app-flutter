import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:stacked/stacked.dart';
import 'dashboard_viewmodel.dart';


final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'Print',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();

class WebView extends StatelessWidget {
  final selectedUrl;
  WebView(this.selectedUrl);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      builder:(context, model, child)=>WillPopScope(
        onWillPop: (){
          // model.goback();
          return model.goback()??true;
        },
              child: WebviewScaffold(
          url: selectedUrl,
          javascriptChannels: jsChannels,
          mediaPlaybackRequiresUserGesture: false,
          appBar: AppBar(
            elevation:0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black,),
              onPressed: () async => await model.goback(),
            ),
            backgroundColor: Colors.grey[50]

          ),
          withZoom: true,
          withLocalStorage: true,
          hidden: true,

          initialChild: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 5,),
                  Text('Please Wait...'),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder:()=>DashboardViewModel(),
    );
  }
}
