
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auspi_ravi_flutter/App_logic/app_logic_controller.dart';
import 'package:auspi_ravi_flutter/SizeConfig.dart';
import 'dart:math';

class WidgetViewPage extends StatelessWidget {
  final String dialType; // Identifier for the dial type ('planet_position' or 'sevenday_dial')

  WidgetViewPage({required this.dialType});

  @override
  Widget build(BuildContext context) {
    final app_logic_controller controller = Get.find<app_logic_controller>();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Text(
          'Back',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 2 * SizeConfig.textMultiplier,
            fontFamily: 'Abel',
          ),
        ),
        backgroundColor: Color(0xFF29b1ef),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: GetBuilder<app_logic_controller>(
        builder: (controller) => Center(
          child: Container(
            color: Colors.white,
            height: 100 * SizeConfig.heightMultiplier,
            width: 100 * SizeConfig.widthMultiplier,
            child: dialType == 'planet_position'
                ? planet_position(controller)
                : sevenday_dial(controller, 80, 80),
          ),
        ),
      ),
    );
  }

  Widget planet_position(app_logic_controller controller) {
    final double handScale = 0.7; // Scale factor for hands (70% of original size)
    return InteractiveViewer(
      child: Container(
        height: 80 * SizeConfig.heightMultiplier,
        width: 80 * SizeConfig.heightMultiplier,
        child: Stack(
          children: [
            Center(
              child: Container(
                child: Image.asset("assets/chandra.png", fit: BoxFit.fill),
              ),
            ),
            Transform.rotate(
              angle: (controller.hour_rotation * pi) / 180,
              child: Center(
                child: SizedBox(
                  height: 80 * SizeConfig.heightMultiplier * handScale,
                  width: 80 * SizeConfig.heightMultiplier * handScale,
                  child: Image.asset("assets/hourhand.png", fit: BoxFit.fitHeight),
                ),
              ),
            ),
            Transform.rotate(
              angle: (double.parse("${controller.minutes_rotation}") * pi) / 180,
              child: Center(
                child: SizedBox(
                  height: 80 * SizeConfig.heightMultiplier * handScale,
                  width: 80 * SizeConfig.heightMultiplier * handScale,
                  child: Image.asset("assets/minutehand.png", fit: BoxFit.fitHeight),
                ),
              ),
            ),
            Transform.rotate(
              angle: (double.parse("${controller.seconds_rotation}") * pi) / 180,
              child: Center(
                child: SizedBox(
                  height: 80 * SizeConfig.heightMultiplier * handScale,
                  width: 80 * SizeConfig.heightMultiplier * handScale,
                  child: Image.asset(
                    "assets/sechand.png",
                    fit: BoxFit.fitHeight,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Transform.rotate(
              angle: (double.parse("${controller.Solar_deg_new}") * pi) / 180,
              child: Center(
                child: SizedBox(
                  height: 80 * SizeConfig.heightMultiplier * handScale,
                  width: 80 * SizeConfig.heightMultiplier * handScale,
                  child: Image.asset("assets/sun.png", fit: BoxFit.fitHeight),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sevenday_dial(app_logic_controller controller, double height, double width) {
    final double handScale = 0.7; // Scale factor for hands (70% of original size)
    return InteractiveViewer(
      child: Container(
        height: height * SizeConfig.heightMultiplier,
        width: width * SizeConfig.heightMultiplier,
        child: Stack(
          children: [
            Center(
              child: Container(
                child: Image.asset(
                  "assets/${controller.days.toLowerCase()}.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Transform.rotate(
              angle: (controller.hour_rotation * pi) / 180,
              child: Center(
                child: SizedBox(
                  height: height * SizeConfig.heightMultiplier * handScale,
                  width: width * SizeConfig.heightMultiplier * handScale,
                  child: Image.asset("assets/hourhand.png", fit: BoxFit.fitHeight),
                ),
              ),
            ),
            Transform.rotate(
              angle: (double.parse("${controller.minutes_rotation}") * pi) / 180,
              child: Center(
                child: SizedBox(
                  height: height * SizeConfig.heightMultiplier * handScale,
                  width: width * SizeConfig.heightMultiplier * handScale,
                  child: Image.asset("assets/minutehand.png", fit: BoxFit.fitHeight),
                ),
              ),
            ),
            Transform.rotate(
              angle: (double.parse("${controller.seconds_rotation}") * pi) / 180,
              child: Center(
                child: SizedBox(
                  height: height * SizeConfig.heightMultiplier * handScale,
                  width: width * SizeConfig.heightMultiplier * handScale,
                  child: Image.asset("assets/sechand.png", fit: BoxFit.fitHeight),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';

// import 'App_logic/app_logic_controller.dart';
// import 'SizeConfig.dart';


// class WidgetViewPage extends StatelessWidget {

//   //var imgList;
//   var g_dial;
//   WidgetViewPage({@required this.g_dial});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//           floatingActionButton: FloatingActionButton(
//             child: Text('Back',
//                 style: TextStyle(
//                   color:  Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize:
//                   2 * SizeConfig.textMultiplier,fontFamily: 'Abel',)),
//             backgroundColor: Color(0xFF29b1ef),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         body: GetBuilder<app_logic_controller>(
//             init: app_logic_controller(),
//             builder: (controller) =>  Center(
//           child:g_dial
//           ),
//         )
//     );
//     // ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
//     // return Scaffold(
//     //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     //   floatingActionButton: FloatingActionButton(
//     //     child: Text('Back',
//     //         style: TextStyle(
//     //           color:  Colors.white,
//     //           fontWeight: FontWeight.bold,
//     //           fontSize:
//     //           2 * SizeConfig.textMultiplier,fontFamily: 'Abel',)),
//     //     backgroundColor: Color(0xFF29b1ef),
//     //     onPressed: () {
//     //       Navigator.of(context).pop();
//     //     },
//     //   ),
//     //   body: Column(
//     //     children: [
//     //       Container(
//     //           color: Colors.white,
//     //           height: 100 * SizeConfig.heightMultiplier,
//     //           width: 100 * SizeConfig.widthMultiplier,
//     //
//     //           child: PhotoViewGallery.builder(
//     //             scrollPhysics:  BouncingScrollPhysics(),
//     //             backgroundDecoration:BoxDecoration(color: Colors.white),
//     //             builder: (BuildContext context, int index) {
//     //               return PhotoViewGalleryPageOptions(
//     //                 imageProvider: AssetImage(imgList[index]),
//     //                 initialScale: PhotoViewComputedScale.contained * 0.8,
//     //                 heroAttributes: PhotoViewHeroAttributes(tag: imgList[index]),
//     //
//     //               );
//     //             },
//     //             itemCount: imgList.length,
//     //             loadingBuilder: (context, event) => Center(
//     //               child: Container(
//     //                 color: Colors.white,
//     //                 width: 90.0,
//     //                 height: 90.0,
//     //                 child: CircularProgressIndicator(
//     //                   strokeWidth: 1.5 * SizeConfig.widthMultiplier,
//     //                   backgroundColor:Colors.white,
//     //                   valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF29b1ef)),
//     //                   // semanticsLabel: "Downloading file abc.mp3",
//     //                   // semanticsValue: "Percent " + (100).toString() + "%",
//     //                   value: event == null
//     //                       ? 0
//     //                       : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
//     //                 ),
//     //               ),
//     //             ),
//     //           )
//     //       ),
//     //     ],
//     //   ),
//     // );


//   }


// }

