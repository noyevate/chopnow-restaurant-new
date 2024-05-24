
import 'package:chopnow_restaurant_2/common/background_container.dart';
import 'package:chopnow_restaurant_2/common/color_extension.dart';
import 'package:chopnow_restaurant_2/common/custom_appbar.dart';
import 'package:chopnow_restaurant_2/common/custom_button.dart';
import 'package:chopnow_restaurant_2/common/size.dart';
import 'package:chopnow_restaurant_2/controlllers/login_controller.dart';
import 'package:chopnow_restaurant_2/controlllers/order_controller.dart';
import 'package:chopnow_restaurant_2/controlllers/save_restaurant_id.dart';
import 'package:chopnow_restaurant_2/hooks/fetch_restaurant.dart';
import 'package:chopnow_restaurant_2/models/restaurant_respons_model.dart';
import 'package:chopnow_restaurant_2/views/auth/login_page.dart';
import 'package:chopnow_restaurant_2/views/home/widgets/orders/cancelled_orders.dart';
import 'package:chopnow_restaurant_2/views/home/widgets/orders/delivered_orders.dart';
import 'package:chopnow_restaurant_2/views/home/widgets/orders/new_orders.dart';
import 'package:chopnow_restaurant_2/views/home/widgets/orders/picked_orders.dart';
import 'package:chopnow_restaurant_2/views/home/widgets/orders/preparing.dart';
import 'package:chopnow_restaurant_2/views/home/widgets/orders/ready_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/login_response_model.dart';
import 'widgets/home_tabs.dart';
import 'widgets/home_tiles.dart';

class HomePage extends StatefulHookWidget {
  final int? initialTabIndex; // Add this parameter

  const HomePage({Key? key, this.initialTabIndex})
      : super(key: key); // Add this parameter

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: orderList.length, vsync: this);

    if (widget.initialTabIndex != null) {
      // Set initial tab index if provided
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _tabController.animateTo(widget.initialTabIndex!);
      });
    }

    final orderController = Get.put(OrderController());
    orderController.setTabController(_tabController);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginResponseModel? user;
    final controller = Get.put(LoginController());

    final box = GetStorage();
    String? token = box.read('token');

    if (token != null) {
      user = controller.getUserInfo();
      print(user!.email);
    }

    if (token == null) {
      return const LoginPage();
    }

    final hookResult = useFetchRestaurant();
    List<RestaurantResponsModel>? restaurant = hookResult.data ?? [];
    useEffect(() {
      if (restaurant.isNotEmpty) {
        StorageService.saveRestaurantId(restaurant[0].id);
      }
      return;
    }, [restaurant]);

    return Scaffold(
      backgroundColor: Tcolor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Tcolor.primary,
        flexibleSpace: const CustomAppBar(),
      ),
      body: BackgroundContainer(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 25.h),
            const HomeTiles(),
            SizedBox(height: 25.h),
            HomeTabs(tabController: _tabController),
            SizedBox(height: 25.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              height: height * 0.455,
              color: Colors.transparent,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  NewOrders(),
                  Preparing(),
                  ReadyOrders(),
                  PickedOrders(),
                  //Deliveries(),
                  DeliveredOrders(),
                  CancelledOrders()
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              child: CustomButton(
                title: "Logout",
                raduis: 20.r,
                btnColor: Tcolor.primary,
                onTap: () {
                  controller.logout();
                },
                btnHeight: 70.h,
                btnWidth: width / 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
