import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'dashboard_viewmodel.dart';

class DashBoard extends StatelessWidget {
  var height;

  

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ViewModelBuilder<DashboardViewModel>.reactive(
      builder:(context, model, child)=>Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                AnimatedSwitcher(
                duration: Duration(seconds: 1),
            transitionBuilder:(Widget child, Animation<double> animation){
              // final outAnimation = Tween<Offset>(begin: Offset(1.0, 0.0),
              //  end: Offset(0.0, 0.0)).animate(animation);

              //  final inAnimation = Tween<Offset>(begin: Offset(-1.0, 0.0),
              //  end: Offset(0.0, 0.0)).animate(animation);
              // if(child.key == ValueKey(1)){
              //   return ClipRect(
              //     child: SlideTransition(
              //    position: inAnimation,
              //    child: child,
              //    ),
              //   );

              // }else{
              //    return ClipRect(
              //     child: SlideTransition(
              //    position: outAnimation,
              //    child: child,
              //    ),
              //   );
              // }
              return ScaleTransition(
                  child: child,
                  scale: animation,
                );
            },


              child:
              !model.isSwitched? Container(
                  key: ValueKey(1),
                  height: height/6,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width/1.5,
                        child: SvgPicture.asset(
                          model.assetName,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search, size: width/12, color: Color(0xFF0a0a23),),
                        onPressed: ()=>model.updateIsSwitched(),
                      ),
                    ],
                  ),
               
                ):Container(
                  key: ValueKey(2),
                  height: height/6,
                                  child: Center(
                                    child: TextField(
                    onChanged: model.search,
                    maxLines: null,
                    autofocus: false,

                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      hintText: 'Search 6,000+ tutorials',
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintStyle:  GoogleFonts.robotoMono(),
                      
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none
                      ),
                     
                      suffixIcon: IconButton(
                        onPressed: (){
                          model.updateIsSwitched();

                        },
                        icon: Icon(Icons.cancel, color: Color(0xFF2a2a40),))
                      
                    ),
                    onSubmitted: (value){
                      model.gotoWebPage(model.searchText);

                    },
                  ),
                                  ),
                ),),
                optionCard('News', Color(0xFF3b3b4f), model, '${model.baseUrl}/news'),
                optionCard('Learn', Color(0xFF2a2a40), model, '${model.baseUrl}/learn'),
                optionCard('Forum', Color(0xFF0a0a23), model, '${model.baseUrl}/forum'),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder:()=>DashboardViewModel(),
    );
  }
  Widget optionCard(String text, Color color,
      DashboardViewModel model, String url) => InkWell(
    onTap: ()=> model.gotoWebPage(url),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Container(
        height: height/4,
          decoration: BoxDecoration(
           color: color,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(child: Text('/$text', style: GoogleFonts.robotoMono(
            textStyle: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          ))),
    ),
  );
  Widget animated = Container();
}
