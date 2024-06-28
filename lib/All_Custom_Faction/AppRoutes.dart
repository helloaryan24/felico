
import 'package:felico/Onboarding%20screen/Onboarding_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Welcome Screen/Add_Bank_Account_Details_Page.dart';
import '../Welcome Screen/Gst_Page.dart';
import '../Welcome Screen/Pickup_Address_Page.dart';
import '../Welcome Screen/Splash_Screen.dart';
import '../Welcome Screen/Welcome_Entername_Page.dart';

class AppRoutes {
  static const String initial = '/';
  static const String NameInput_Screen = '/Name_Input_Screen';
  static const String Onboarding_Page = '/On_boarding_Page';
  static const String Gst_Screen = '/Gst_Screen';
  static const String Pickup_Address_Page = '/PickupAddress_Page';
  static const String AddBank_AccountDetails_Page = '/AddBankAccountDetails_Page';
  // static const String BottomBarPage = '/BottomBar_Page';
  // static const String ForgetpasswordPage = '/Forgetpassword_Page';
  // static const String OTPVerificationPage = '/OTPVerification_Page';
  // static const String ProductsPage = '/Products_Page';
  // static const String productsdetails = '/products_details';
  // static const String Checkoutpage = '/Check_out_page';
  // static const String filtere = '/Filter_Page';

  static final routes = [

    GetPage(
      name: initial,
      page: () => SplashScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: NameInput_Screen,
      page: () => NameInputScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Gst_Screen,
      page: () => GstScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Pickup_Address_Page,
      page: () => PickupAddress_Page(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: AddBank_AccountDetails_Page,
      page: () => AddBankAccountDetails_Page(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),

    GetPage(
      name: Onboarding_Page,
      page: () => OnboardingPage(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    // GetPage(
    //   name: BottomBarPage,
    //   page: () => BottomBar_Page(),
    //   transitionDuration: Duration(milliseconds: 250),
    //   transition: Transition.leftToRightWithFade,
    // ),
    // GetPage(
    //   name: ForgetpasswordPage,
    //   page: () => Forgetpassword_Page(),
    //   transitionDuration: Duration(milliseconds: 250),
    //   transition: Transition.leftToRightWithFade,
    // ),
    // GetPage(
    //   name: OTPVerificationPage,
    //   page: () => OTPVerification_Page(),
    //   transitionDuration: Duration(milliseconds: 250),
    //   transition: Transition.leftToRightWithFade,
    // ),
    // GetPage(
    //   name: ProductsPage,
    //   page: () => Products_Page(),
    //   transitionDuration: Duration(milliseconds: 250),
    //   transition: Transition.leftToRightWithFade,
    // ),
    // GetPage(
    //   name: productsdetails,
    //   page: () => products_details(),
    //   transitionDuration: Duration(milliseconds: 250),
    //   transition: Transition.leftToRightWithFade,
    // ),
    // GetPage(
    //   name: filtere,
    //   page: () => Filter_Page(),
    //   transitionDuration: Duration(milliseconds: 250),
    //   transition: Transition.leftToRightWithFade,
    // ),
    // GetPage(
    //   name: Checkoutpage,
    //   page: () => Check_out_page(),
    //   transitionDuration: Duration(milliseconds: 250),
    //   transition: Transition.leftToRightWithFade,
    // ),


  ];
}
