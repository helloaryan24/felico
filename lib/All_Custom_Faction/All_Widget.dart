import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import 'Colors.dart';
import 'Image.dart';
import 'TextStyle.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onTap;
  final TextStyle style;

  const CustomButton({
    required this.text,
    required this.backgroundColor,
    required this.onTap,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: style,
          ),
        ),
      ),
    );
  }
}

Widget buildInputField({
  required String hintText,
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  bool obscureText = false,
  TextInputAction? textInputAction,
  FocusNode? focusNode,
  FocusNode? nextFocusNode,
}) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: AppColors.blackcolor,
      style: TextStyles.ProductSansRegular6,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whitecolor.withOpacity(0.1),
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyles.ProductSansRegular6,
        contentPadding: EdgeInsets.all(15),
        focusColor: AppColors.buttoncolor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.whitecolor), // Remove border when focused
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.whitecolor), // Remove border when focused
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}

class CustomButton1 extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onTap;
  final TextStyle style;

  const CustomButton1({
    required this.text,
    required this.backgroundColor,
    required this.onTap,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color:AppColors.gradientcolor1,width: 2),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
              text,
              textAlign: TextAlign.center,
              style: style,

          ),
        ),
      ),
    );
  }
}

class AlertDialogBox extends StatelessWidget {
  final String message; // Define a parameter for the message

  const AlertDialogBox({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50, width: 50,
                child: Lottie.asset(
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  animate: true,
                  Images.error,
                ),
              ),
              SizedBox(width: 10),
              Expanded( // Use Expanded instead of Flexible
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    message,
                    style: TextStyles.ProductSansBold2,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "OK",
                    textAlign: TextAlign.center,
                    style: TextStyles.ProductSansBold8,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5))),
        )
      ],
    );
  }
}


class AlertDialogbox1 extends StatelessWidget {
  final String message; // Define a parameter for the message
  final VoidCallback onOkTap; // Define a callback for the OK button
  final VoidCallback onCancelTap; // Define a callback for the Cancel button

  const AlertDialogbox1({
    Key? key,
    required this.message,
    required this.onOkTap,
    required this.onCancelTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Lottie.asset(
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  animate: true,
                  Images.error,
                ),
              ),
              SizedBox(width: 10),
              Expanded( // Use Expanded instead of Flexible
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    message,
                    style: TextStyles.ProductSansBold2,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onCancelTap, // Handle Cancel button press
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Cancel",
                    textAlign: TextAlign.center,
                    style: TextStyles.ProductSansBold1,
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: onOkTap, // Handle OK button press
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "OK",
                    textAlign: TextAlign.center,
                    style: TextStyles.ProductSansBold1,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5))),
        ),
      ],
    );
  }
}

Widget lottieAnimation(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.whitecolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Lottie.asset(
            alignment: Alignment.center,
            animate: true,
            Images.loder,
          ),
        ),
      ),
    ),
  );
}
Widget errorlottieAnimation(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.whitecolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Lottie.asset(
            alignment: Alignment.center,
            animate: true,
            Images.error,
          ),
        ),
      ),
    ),
  );
}


void showSuccessSnackbar(String msg,
    {SnackPosition? position,
      Color iconColor = Colors.red,
      IconData icon = Icons.error,
      Color containerColor = Colors.red}) {
  Get.closeAllSnackbars();
  Get.snackbar(
    '',
    '',
    messageText: Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: iconColor,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    msg,
                    style: TextStyles.ProductSansBold2,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            width: double.infinity,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
          )
        ],
      ),
    ),
    titleText: const SizedBox.shrink(),
    snackPosition: position ?? SnackPosition.BOTTOM,
    backgroundColor: Colors.white,
    colorText: AppColors.whitecolor,
    borderRadius: 5,
    margin: const EdgeInsets.all(10),
    padding: EdgeInsets.all(0),
    dismissDirection: DismissDirection.horizontal,
    boxShadows: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 1,
        spreadRadius: 1,
        offset: Offset(0, 0),
      ),
    ],
  );
}

showErrorSnackbar(String msg, {SnackPosition? position}) {
  Get.closeAllSnackbars();
  Get.snackbar(
    '',
    '',
    messageText: Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        msg,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Poppins1',
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    titleText: const SizedBox.shrink(),
    snackPosition: position ?? SnackPosition.BOTTOM,
    backgroundColor: Colors.red[900],
    dismissDirection: DismissDirection.horizontal,
    margin: const EdgeInsets.all(20),
  );
}

