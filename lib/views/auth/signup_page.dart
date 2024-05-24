
import 'package:chopnow_restaurant_2/common/background_container.dart';
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/custom_button.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/controlllers/signup_controller.dart';
import 'package:chopnow_restaurant_2/models/signup_model.dart';
import 'package:chopnow_restaurant_2/views/auth/login_page.dart';
import 'package:chopnow_restaurant_2/views/auth/widget/email_textfield.dart';
import 'package:chopnow_restaurant_2/views/auth/widget/password_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final TextEditingController _emailController = TextEditingController();
   late final TextEditingController _passwordController =
      TextEditingController();

  late final TextEditingController _userController = TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();
  String _selectedUserType = 'Vendor';

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());
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
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 400.h,
              child: Lottie.asset(
                "assets/animation/delivery_guy.json",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  EmailTextField(
                    hintText: "Username..",
                    prefixIcon: Icon(
                      CupertinoIcons.profile_circled,
                      size: 40.h,
                      color: Tcolor.placeHolder,
                    ),
                    controller: _userController,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  EmailTextField(
                    hintText: "Enter Email..",
                    prefixIcon: Icon(
                      CupertinoIcons.mail,
                      size: 40.h,
                      color: Tcolor.placeHolder,
                    ),
                    controller: _emailController,
                  ),

                 Row(
              children: [
                Radio(
                  value: 'Vendor',
                  groupValue: _selectedUserType,
                  //fillColor: Color.fromARGB(255, 225, 179, 62),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedUserType = value!;
                    });
                  },
                  activeColor: Tcolor.primary,
                ),
                ReuseableText(title: "Restaurant", style: TextStyle(color: Tcolor.gray)),
              ],
            ),
            
                  SizedBox(
                    height: 30.h,
                  ),
                  PasswordTextField(
                    controller: _passwordController,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const LoginPage());
                          },
                          child: ReuseableText(
                            title: "Login",
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
                    height: 60.h,
                  ),
                  CustomButton(
                    title: "R E G I S T E R",
                    onTap: () {
                      if (_emailController.text.isNotEmpty &&
                          _userController.text.isNotEmpty &&
                          _passwordController.text.length >= 8 && _selectedUserType == "Vendor") {
                        RegistrationModel model = RegistrationModel(
                            username: _userController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            userType: _selectedUserType
                            );

                          String data = registrationModelToJson(model);
                        //registration Function
                          controller.registrationFunction(data);

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
