import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../All_Custom_Faction/Colors.dart';
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

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );

    // Initialize the animation
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    // Start the animation when the screen loads
    _controller.forward();


    // Check login status after the splash screen delay
    _checkLoginStatus();
  }

  // Function to check login status and navigate accordingly
  void _checkLoginStatus() async {
    await Future.delayed(Duration(seconds: 3)); // Delay for splash screen effect

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      Get.offNamed('/Task_Page'); // Navigate to Task_Page if logged in
    } else {
      Get.offNamed('/Login_Screen'); // Navigate to Login_Screen if not logged in
    }
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
