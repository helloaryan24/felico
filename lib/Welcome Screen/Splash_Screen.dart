// import 'package:felico/All_Custom_Faction/Colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../All_Custom_Faction/Image.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Navigate to '/Name_Input_Screen' after a delay
//     Future.delayed(Duration(seconds: 3), () {
//       Get.offNamed('/On_boarding_Page'); // Replace with your desired route
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           color: AppColors.whitecolor,
//         ),
//         child: Center(
//           child: Flex(
//             direction: Axis.vertical,
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 Images.applogo,
//                 height: 300,
//                 width: 300,
//               ), // Adjust the path as necessary
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:felico/All_Custom_Faction/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../All_Custom_Faction/Image.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    // Start the animation when the screen loads
    _controller.forward();

    // Navigate to '/On_boarding_Page' after a delay
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed('/On_boarding_Page'); // Replace with your desired route
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.whitecolor,
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Opacity(
                opacity: _animation.value,
                child: Transform.scale(
                  scale: _animation.value,
                  child: Image.asset(
                    Images.applogo,
                    height: 300,
                    width: 300,
                  ), // Adjust the path as necessary
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
