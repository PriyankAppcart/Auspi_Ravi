
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'App_logic/app_logic_controller.dart';
import 'SizeConfig.dart';


class WidgetViewPage extends StatelessWidget {

  //var imgList;
  var g_dial;
  WidgetViewPage({@required this.g_dial});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            child: Text('Back',
                style: TextStyle(
                  color:  Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize:
                  2 * SizeConfig.textMultiplier,fontFamily: 'Abel',)),
            backgroundColor: Color(0xFF29b1ef),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        body: GetBuilder<app_logic_controller>(
            init: app_logic_controller(),
            builder: (controller) =>  Center(
          child:g_dial
          ),
        )
    );
    // ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    // return Scaffold(
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    //   floatingActionButton: FloatingActionButton(
    //     child: Text('Back',
    //         style: TextStyle(
    //           color:  Colors.white,
    //           fontWeight: FontWeight.bold,
    //           fontSize:
    //           2 * SizeConfig.textMultiplier,fontFamily: 'Abel',)),
    //     backgroundColor: Color(0xFF29b1ef),
    //     onPressed: () {
    //       Navigator.of(context).pop();
    //     },
    //   ),
    //   body: Column(
    //     children: [
    //       Container(
    //           color: Colors.white,
    //           height: 100 * SizeConfig.heightMultiplier,
    //           width: 100 * SizeConfig.widthMultiplier,
    //
    //           child: PhotoViewGallery.builder(
    //             scrollPhysics:  BouncingScrollPhysics(),
    //             backgroundDecoration:BoxDecoration(color: Colors.white),
    //             builder: (BuildContext context, int index) {
    //               return PhotoViewGalleryPageOptions(
    //                 imageProvider: AssetImage(imgList[index]),
    //                 initialScale: PhotoViewComputedScale.contained * 0.8,
    //                 heroAttributes: PhotoViewHeroAttributes(tag: imgList[index]),
    //
    //               );
    //             },
    //             itemCount: imgList.length,
    //             loadingBuilder: (context, event) => Center(
    //               child: Container(
    //                 color: Colors.white,
    //                 width: 90.0,
    //                 height: 90.0,
    //                 child: CircularProgressIndicator(
    //                   strokeWidth: 1.5 * SizeConfig.widthMultiplier,
    //                   backgroundColor:Colors.white,
    //                   valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF29b1ef)),
    //                   // semanticsLabel: "Downloading file abc.mp3",
    //                   // semanticsValue: "Percent " + (100).toString() + "%",
    //                   value: event == null
    //                       ? 0
    //                       : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
    //                 ),
    //               ),
    //             ),
    //           )
    //       ),
    //     ],
    //   ),
    // );


  }


}

