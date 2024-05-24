
import 'package:chopnow_restaurant_2/common/background_container.dart';
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/controlllers/location_controller.dart.dart';
import 'package:chopnow_restaurant_2/controlllers/login_controller.dart';
import 'package:chopnow_restaurant_2/controlllers/restaurant_controller.dart';
import 'package:chopnow_restaurant_2/controlllers/signup_controller.dart';
import 'package:chopnow_restaurant_2/controlllers/uploader_controller.dart';
import 'package:chopnow_restaurant_2/models/login_response_model.dart';
import 'package:chopnow_restaurant_2/models/restaurant_model.dart';
import 'package:chopnow_restaurant_2/views/auth/login_page.dart';
import 'package:chopnow_restaurant_2/views/create_restaurant/widget/coord_info.dart';
import 'package:chopnow_restaurant_2/views/create_restaurant/widget/restaurant_image.dart';
import 'package:chopnow_restaurant_2/views/create_restaurant/widget/restaurant_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class CreateRestaurant extends StatefulWidget {
  const CreateRestaurant({super.key});

  @override
  State<CreateRestaurant> createState() => _CreateRestaurantState();
}

class _CreateRestaurantState extends State<CreateRestaurant> {
  final PageController _pageController = PageController();
  final TextEditingController Title = TextEditingController();
  final TextEditingController time = TextEditingController();
  //final TextEditingController price = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController owner = TextEditingController();
  //final TextEditingController types = TextEditingController();

  // final TextEditingController additivePrice = TextEditingController();
  // final TextEditingController additiveTitle = TextEditingController();

  final TextEditingController coordTitle = TextEditingController();
  final TextEditingController coordLatitude = TextEditingController();
  final TextEditingController coordLongitude = TextEditingController();

  final TextEditingController address = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    Title.dispose();
    owner.dispose();
    time.dispose();
    phone.dispose();
    coordTitle.dispose();
    coordLatitude.dispose();
    coordLongitude.dispose();
    address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        final box = GetStorage();

    final controller = Get.put(UploaderController());
    final signUpController = Get.put(RegistrationController());
    final locationController = Get.put(LocationController());
    final restaurantConroller = Get.put(RestaurantController());

    LoginResponseModel? user;
    final loginController = Get.put(LoginController());

    String? token = box.read('token');

    if (token != null) {
      user = loginController.getUserInfo();
    }

    if (token == null) {
      return const LoginPage();
    }
    // if (user != null && user.verification == false) {
    //   //return const VerificationPage();
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolor.primary,
        centerTitle: true,
        title: Column(
          children: [
            ReuseableText(
              title: "Welcome to the Restaurant Panel",
              style: TextStyle(
                  fontSize: 24.sp,
                  color: Tcolor.Text,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            ReuseableText(
              title: "Fill all required infoto add food items",
              style: TextStyle(
                  fontSize: 24.sp,
                  color: Tcolor.Text,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      body: BackgroundContainer(
          child: ListView(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              pageSnapping: false,
              children: [
                RestaurantInfo(
                  next: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeIn);
                  },
                  title: Title,
                  time: time,
                  phone: phone,
                  owner: owner,
                ),
                RestaurantImage(
                  back: () {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeIn);
                  },
                  next: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeIn);
                  },
                ),
                CoordInfo(
                    back: () {
                      _pageController.previousPage(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeIn);
                    },
                    address: address,
                    coordLatitude: coordLatitude,
                    coordLongitude: coordLongitude,
                    coordTitle: coordTitle,
                    onSubmit: () async{
                      try {
                        if (coordTitle.text.isNotEmpty &&
                            coordLongitude.text.isNotEmpty &&
                            coordLatitude.text.isNotEmpty &&
                            address.text.isNotEmpty &&
                            Title.text.isNotEmpty &&
                            time.text.isNotEmpty &&
                            controller.imageOneUrl.isNotEmpty &&
                            phone.text.isNotEmpty &&
                            controller.imageTwoUrl.isNotEmpty &&
                            owner.text.isNotEmpty) {
                          double latitude = double.parse(coordLatitude.text);
                          double longitude = double.parse(coordLongitude.text);
                          RestaurantModel model = RestaurantModel(
                              title: Title.text,
                              userId: user!.id,
                              time: time.text,
                              imageUrl: controller.imageOneUrl,
                              code: phone.text,
                              logoUrl: controller.imageTwoUrl,
                              owner: owner.text,
                              coords: Coords(
                                  id: locationController.coordGenerateId(),
                                  latitude: latitude,
                                  longitude: longitude,
                                  address: address.text,
                                  title: coordTitle.text));
                          String data = restaurantModelToJson(model);
                          restaurantConroller.createRestaurant(data);
                         
                          //var restaurantId = await restaurantConroller.fetchRestaurantId(model.title.toString());
                          //print("restaurantId: $restaurantId");
                           
                          //Get.to(() => RestaurantDashbord());
                        } else {}
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    },
                    onClosePageView: () {
                      Navigator.of(context).pop();
                }),

                    
              ],
            ),
          ),
        ],
      )),
    );
  }
}
