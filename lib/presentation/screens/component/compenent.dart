import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/utils/app_color.dart';


Widget defaultButton({
  double width = double.infinity,
  Color background = mainColor,
  required var function,
  required String text,
  var fontSize,
  bool isUpperCase = true,
  double radius = 10.0,
}) =>
    Container(
      width: width,
      height: 60.0,
      margin: EdgeInsets.all(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: mainColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
Widget logButton({
  double width = double.infinity,
  Color background = mainColor,
  required var function,
  required String text,
  var fontSize,
  bool isUpperCase = true,
  double radius = 10.0,
  required String icon
}) =>
    Container(
      width: width,
      height: 60.0,
      margin: EdgeInsets.all(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Color(0xffF2F3F2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Image.asset(icon),
            SizedBox(width: 60.w,),
            MaterialButton(
              onPressed: function,
              child: Text(
                text,
                style: TextStyle(
                    color: mainColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );

Widget defaultAuthButton({
  double width = double.infinity,
  Color background = mainColor,
  required var function,
  required String text,
  required Color color,
  var fontSize=18.0,
  String? image,
  bool isUpperCase = true,
  double radius = 25.0,
}) =>
    Container(
      width: width,
      height: 60.0,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),

      ),
      child: MaterialButton(
        color: color,
        onPressed: function,
        child: Row(
          children: [
            Image(image: AssetImage(image??"")),
            SizedBox(
              width: 25,
            ),
            Expanded(
              child: Text(
                isUpperCase ? text.toUpperCase() : text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w200),
              ),
            ),
          ],
        ),
      ),
    );
Widget defaultTextButton(
        {
          required String text,
          required var pressedFunction,
          Color color=Colors.black
        }) =>
    TextButton(
        onPressed: pressedFunction,
        child: Text(
          text,
          style:  TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15,
            color: color
          ),
        ));

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  var onsubmit,
  IconData? widget,
  var onChange,
  var onTap,
  IconData? suffixIcon2,
  String? hintText,
  var prefixIconTapFunction,
  required var validator,
  String? label,
   IconData? prefixIcon,
  var suffixIcon,
  bool keyBoardApper=true,
  bool isPassword = false,
  var sufixPressed,
  var sufixPressed2,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onsubmit,
      onChanged: onChange,
      validator: validator,
      obscureText: isPassword,
      onTap: onTap,

      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Color(0xFFF2F3F2),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          labelStyle: const TextStyle(
              color: Colors.black,
            fontWeight: FontWeight.normal
          ),
          suffixIcon: IconButton(onPressed: sufixPressed, icon: Icon(suffixIcon)),

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: mainColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
              borderSide: const BorderSide(
                color: mainColor,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.white,
              ))),
    );

Widget defaultSearchField({
  required TextEditingController controller,
  required TextInputType type,
  var onsubmit,
  var onChange,
  var onTap,
  String? hintText,
  var prefixIconTapFunction,
  required var validator,
  String? label,
   var prefixIcon,
  var suffixIcon,
  bool isPassword = false,
  var sufixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onsubmit,
      onChanged: onChange,
      validator: validator,
      obscureText: isPassword,
      onTap: onTap,
      decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          labelStyle: const TextStyle(color: Colors.black),
          prefixIcon: InkWell(
            onTap: prefixIconTapFunction,
            child:prefixIcon,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: sufixPressed,
                  icon: Icon(
                    suffixIcon,
                  ))
              : null,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),

              borderSide: const BorderSide(
                color: Colors.grey,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: Colors.grey,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                color: lightTextColor,
              ))),
    );

Widget defultLoginField({
  required TextEditingController controller,
  required TextInputType inputType,
  required String labelText,
  required IconData preIcon,
  required var tabFunction,
  required var validation,
}) =>
    TextFormField(
      decoration: InputDecoration(
        labelText: '$labelText',
        labelStyle: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        prefixIcon: Icon(
          preIcon,
        ),
      ),
      keyboardType: inputType,
      controller: controller,
      onTap: tabFunction,
      validator: validation,
    );

Widget materialBottomLogin({
  required var pressFunction,
  required String bottomText,
  Color backgroundColor = Colors.white24,
  double radius = 20.0,
  double width = double.infinity,
  Color textColor = Colors.black,
}) {
  return Container(
    width: width,
    child: MaterialButton(
      onPressed: pressFunction,
      child: Text(
        '$bottomText',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: textColor),
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: backgroundColor,
    ),
  );
}

Widget defaultSocialLogo({
  required String image,
  Color? color,
  var onTap,
}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.withOpacity(0.2)),
        child: Image(
          image: AssetImage(image),
          color: color,
        ),
      ),
    );

Widget myDivider() => Padding(
  padding: EdgeInsetsDirectional.only(start: 5.0),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  ),
);

void navigateTo(context, widget) => Navigator.push(
    context, MaterialPageRoute(builder: (BuildContext context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false);

void showToast({required String text, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

