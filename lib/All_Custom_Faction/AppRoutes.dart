
import 'package:felico/Onboarding%20screen/Onboarding_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Welcome Screen/Add_Bank_Account_Details_Page.dart';
import '../Welcome Screen/Gst_Page.dart';
import '../Welcome Screen/Pickup_Address_Page.dart';
import '../Welcome Screen/Puchase_Agreement_Page.dart';
import '../Welcome Screen/Select_Category.dart';
import '../Welcome Screen/Select_Material_Page.dart';
import '../Welcome Screen/Splash_Screen.dart';
import '../Welcome Screen/Welcome_Entername_Page.dart';

class AppRoutes {
  static const String initial = '/';
  static const String NameInput_Screen = '/Name_Input_Screen';
  static const String Onboarding_Page = '/On_boarding_Page';
  static const String Gst_Screen = '/Gst_Screen';
  static const String Pickup_Address_Page = '/PickupAddress_Page';
  static const String AddBank_AccountDetails_Page = '/AddBankAccountDetails_Page';
  static const String PuchaseAgreementPage = '/PuchaseAgreement_Page';
  static const String SelectMaterialPage = '/SelectMaterial_Page';
  static const String SelectCategory = '/Select_Category';


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
    GetPage(
      name: PuchaseAgreementPage,
      page: () => PuchaseAgreement_Page(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: SelectMaterialPage,
      page: () => SelectMaterial_Page(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: SelectCategory,
      page: () => Select_Category(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
