
// import 'package:felico/Onboarding%20screen/Onboarding_page.dart';
import 'package:felicodriver/Main_Page/Map_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Authentication Page/Login_Page.dart';
import '../Authentication Page/Signup_Page.dart';
import '../Authentication Page/Otp_Screen.dart';
import '../Authentication Page/Splash_Screen.dart';
import '../Main_Page/Dorp_location_Page.dart';
import '../Main_Page/Task_Page.dart';
import '../Main_Page/VerificationCode_Page.dart';
// import '../Main Screen/Add_Bank_Account_Details_Page.dart';
// import '../Main Screen/Gst_Page.dart';
// import '../Main Screen/Signup_Page.dart';
// import '../Main Screen/Order_Placed_successfully.dart';
// import '../Main Screen/Otp_Screen.dart';
// import '../Main Screen/Pickup_Address_Page.dart';
// import '../Main Screen/Puchase_Agreement_Page.dart';
// import '../Main Screen/SelectMetalCategory_screen.dart';
// import '../Main Screen/Select_EWaste_Category.dart';
// import '../Main Screen/Select_Item_Page.dart';
// import '../Main Screen/Select_Material_Page.dart';
// import '../Main Screen/Select_Plastic_Category.dart';
// import '../Main Screen/Select_paper_Category.dart';
// import '../Main Screen/Sign_up_gst.dart';
// import '../Main Screen/Splash_Screen.dart';
// import '../Main Screen/Welcome_Entername_Page.dart';
//


class AppRoutes {
  static const String initial = '/';
  static const String SignupPageScreen = '/SignupPage_Screen';
  static const String LoginScreen = '/Login_Screen';
  static const String OtpScreen = '/Otp_Screen';
  static const String TaskPage = '/Task_Page';
  static const String MapPage = '/Map_Page';
  static const String VerificationcodePage = '/Verificationcode_Page';
  static const String NextPage = '/nextPage';

  static final routes = [
    GetPage(
      name: initial,
      page: () => SplashScreen(),
      transitionDuration: Duration(milliseconds: 50),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: SignupPageScreen,
      page: () => SignupPage_Screen(),
      transitionDuration: Duration(milliseconds: 500),
        transition: Transition.fadeIn,
        // curve:Curves.fastOutSlowIn
    ),
    GetPage(
      name: LoginScreen,
      page: () => Login_Screen(),
      transitionDuration: Duration(milliseconds: 500),
        transition: Transition.fadeIn,
        // curve:Curves.fastOutSlowIn
    ),
    GetPage(
      name: OtpScreen,
      page: () => Otp_Screen(),
      transitionDuration: Duration(milliseconds: 500),
        transition: Transition.fadeIn,
        // curve:Curves.fastOutSlowIn
    ),
    GetPage(
      name: TaskPage,
      page: () => Task_Page(),
      transitionDuration: Duration(milliseconds: 500),
        transition: Transition.fadeIn,
        // curve:Curves.fastOutSlowIn
    ),
    GetPage(
      name: MapPage,
      page: () => Map_Page(),
      transitionDuration: Duration(milliseconds: 500),
        transition: Transition.fadeIn,
        // curve:Curves.fastOutSlowIn
    ),
    GetPage(
      name: VerificationcodePage,
      page: () => Verificationcode_Page(),
      transitionDuration: Duration(milliseconds: 500),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NextPage,
      page: () => Droping_page(),
      transitionDuration: Duration(milliseconds: 500),
      transition: Transition.fadeIn,
    ),
  ];
}
