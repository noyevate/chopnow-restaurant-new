import 'package:chopnow_restaurant_2/common/background_container.dart';
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/reusable_text.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/controlllers/food_controller.dart';
import 'package:chopnow_restaurant_2/controlllers/login_controller.dart';
import 'package:chopnow_restaurant_2/controlllers/uploader_controller.dart';
import 'package:chopnow_restaurant_2/hooks/fetch_restaurant.dart';
import 'package:chopnow_restaurant_2/models/foodModel.dart';
import 'package:chopnow_restaurant_2/models/login_response_model.dart';
import 'package:chopnow_restaurant_2/models/restaurant_respons_model.dart';
import 'package:chopnow_restaurant_2/views/add_foods/widgets/additives_info.dart';
import 'package:chopnow_restaurant_2/views/add_foods/widgets/food_info.dart';
import 'package:chopnow_restaurant_2/views/add_foods/widgets/image_uploads.dart';
import 'package:chopnow_restaurant_2/views/auth/login_page.dart';
import 'package:chopnow_restaurant_2/views/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'widgets/all_categories.dart';

// ignore: must_be_immutable
class AddFoods extends StatefulHookWidget {
  const AddFoods({super.key});
  //List<RestaurantResponsModel> restaurant;

  @override
  State<AddFoods> createState() => _AddFoodsState();
}

class _AddFoodsState extends State<AddFoods> {
  final PageController _pageController = PageController();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController preparation = TextEditingController();
  final TextEditingController types = TextEditingController();

  final TextEditingController additivePrice = TextEditingController();
  final TextEditingController additiveTitle = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    price.dispose();
    preparation.dispose();
    types.dispose();
    additivePrice.dispose();
    additiveTitle.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

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

    final hookResult = useFetchRestaurant();
    List<RestaurantResponsModel>? restaurant = hookResult.data ?? [];
    final controller = Get.put(FoodController());
    final imageController = Get.put(UploaderController());
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
                  ChooseCategory(
                    next: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeIn);
                    },
                  ),
                  ImageUploads(
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
                  FoodInfo(
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
                    title: title,
                    description: description,
                    price: price,
                    preparation: preparation,
                    types: types,
                  ),
                  AdditiveInfo(
                    additiveTitle: additiveTitle,
                    additivePrice: additivePrice,
                    back: () {
                      _pageController.previousPage(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeIn);
                    },
                    onSubmit: ()  async{
                      if (title.text.isNotEmpty &&
                          description.text.isNotEmpty &&
                          price.text.isNotEmpty &&
                          preparation.text.isNotEmpty) {
                            List<Additive> additives = controller.additiveList.map((additiveModel) {
                          return Additive(
                            id: additiveModel.id,
                            title: additiveModel.title,
                            price: additiveModel.price,
                          );
                        }).toList();
                        FoodModel model = FoodModel(
                            title: title.text,
                            foodTags: controller.types,
                            foodType: controller.types,
                            category: controller.category,
                            code: "0987654321",
                            restaurant: restaurant[0].id,
                            description: description.text,
                            time: preparation.text,
                            price: price.text,
                            additive: 
                              additives

                            ,
                            imageUrl: [
                              imageController.imageOneUrl,
                              imageController.imageTwoUrl,
                              imageController.imageThreeUrl,
                              imageController.imageFourUrl
                            ]);
                        String data = foodModelToJson(model);
                        
                        bool isSuccess = await controller.addFood(data);
                        if (isSuccess) {
                          // ignore: use_build_context_synchronously
                          navigateToHomePage(context);
                        } else {
                          print("Spmet");
                        }
                      }
                    }
   
                      
                    
                     
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void navigateToHomePage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
}
