import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/OnboardingController.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());

    return IntroductionScreen(
      key: controller.introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        _buildPage(
          image: Images.onboringimg1,
          title: 'Sell bulk recyclables online',
          description:'Sell plastic, metal, paper, e-waste, and other recyclables online and get the best rates.'),
        _buildPage(
          image: Images.onboringimg2,
          title: 'Free doorstep pickup and tracking',
          description:'Get materical picked up at your doorstep and track your order till delivery'),
        _buildPage(
          image: Images.onboringimg3,
          title: 'Avali 100% secured payments',
          description:'Avali payments within a few days of material delivery'),
      ],
      showNextButton: true,
      next: Icon(
        Icons.arrow_forward,
        color: Colors.black,
      ),
      done: Text('Done', style: TextStyles.ProductSansRegular),
      onDone: () {

        Get.offAndToNamed('/Name_Input_Screen');
      },
      showSkipButton: true,
      skip: Text(
        'Skip',
        style: TextStyles.ProductSansRegular,
      ),
      dotsDecorator: DotsDecorator(
        color: AppColors.greycolor,
        size: const Size.square(10.0),
        activeColor: AppColors.buttoncolor,
        activeSize: const Size(20.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      baseBtnStyle: TextButton.styleFrom(
        foregroundColor: Colors.black,
      ),
    );
  }

  PageViewModel _buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return PageViewModel(
      decoration: PageDecoration(pageColor: AppColors.whitecolor),
      title: '',
      useScrollView: true,
      bodyWidget: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Image.asset(
            image,
            height: 300.0,
            width: 300.0,
          ),
          SizedBox(height: 30),
          Text(
            title,
            // textAlign: TextAlign.center,
            style: TextStyles.ProductSansBold,
          ),
          SizedBox(height: 10),
          Text(
            description,
            // textAlign: TextAlign.center,
            style: TextStyles.ProductSansRegular,
          ),
        ],
      ),
    );
  }
}
