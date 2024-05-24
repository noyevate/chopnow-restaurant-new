

import 'package:chopnow_restaurant_2/common/background_container.dart';
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/custom_button.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/controlllers/login_controller.dart';
import 'package:chopnow_restaurant_2/models/login_model.dart';
import 'package:chopnow_restaurant_2/views/auth/signup_page.dart';
import 'package:chopnow_restaurant_2/views/auth/widget/email_textfield.dart';
import 'package:chopnow_restaurant_2/views/auth/widget/password_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController()); 
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Tcolor.primary,
        title: ReuseableText(
            title: "Chop Now Restaurants",
            style: TextStyle(
                fontSize: 50.h,
                color: Tcolor.Text,
                fontWeight: FontWeight.bold)),
      ),
      body: BackgroundContainer(
        color: Tcolor.Lightwhite,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 500.h,
              child: Lottie.asset(
                "assets/animation/delivery_guy.json",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  EmailTextField(
                    hintText: "Email",
                    prefixIcon: Icon(
                      CupertinoIcons.mail,
                      size: 40.h,
                      color: Tcolor.placeHolder,
                    ),
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  PasswordTextField(
                    controller: _passwordController,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const RegistrationPage(),
                                transition: Transition.fadeIn,
                                duration: const Duration(milliseconds: 1200));
                          },
                          child: ReuseableText(
                            title: "Register",
                            style: TextStyle(
                                fontSize: 24.h,
                                color: Colors.blue,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButton(
                    title: "L O G I N",
                    onTap: () {
                      if (_emailController.text.isNotEmpty &&
                          _passwordController.text.length >= 8) {
                        LoginModel model = LoginModel(
                            email: _emailController.text,
                            password: _passwordController.text);

                        String data = loginModelToJson(model);
                        controller.loginFunction(data);

                        //login Function
                      }
                    },
                    btnHeight: 70.h,
                    btnWidth: width,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
