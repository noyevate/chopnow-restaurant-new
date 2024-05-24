
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/controlllers/password_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    return Obx(
      () => TextFormField(
        cursorColor: Tcolor.Text,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.visiblePassword,
        obscureText: passwordController.password,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter valid data";
          } else {
            return null;
          }
        },
        style: TextStyle(
            fontSize: 24.h, color: Tcolor.Text, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(
              CupertinoIcons.lock_circle,
              size: 52.h,
              color: Tcolor.placeHolder,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                passwordController.setPassword = !passwordController.password;
              },
              child: Icon(
                passwordController.password ? Icons.visibility : Icons.visibility_off,
                size: 52.h,
                color: Tcolor.placeHolder,
              ),
            ),
            isDense: true,
            contentPadding: EdgeInsets.all(15.r),
            hintStyle: TextStyle(
                fontSize: 24.h,
                color: Tcolor.gray,
                fontWeight: FontWeight.normal),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Tcolor.red,
                  width: .5,
                ),
                borderRadius: BorderRadius.all(Radius.circular(24.r))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Tcolor.primary,
                  width: .5,
                ),
                borderRadius: BorderRadius.all(Radius.circular(18.r))),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Tcolor.red,
                  width: .5,
                ),
                borderRadius: BorderRadius.all(Radius.circular(24.r))),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Tcolor.gray,
                  width: .5,
                ),
                borderRadius: BorderRadius.all(Radius.circular(24.r))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Tcolor.purplr,
                  width: .5,
                ),
                borderRadius: BorderRadius.all(Radius.circular(24.r))),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Tcolor.primary,
                  width: .5,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(24.r),
                ))),
      ),
    );
  }
}
