import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:food_delivery_app/app/modules/home/widgets/categories_items.dart';
import 'package:food_delivery_app/app/modules/home/widgets/custom_bottom_bar.dart';
import 'package:food_delivery_app/app/modules/home/widgets/products_items.dart';
import 'package:food_delivery_app/app/modules/product/views/product_detail.dart';
import 'package:food_delivery_app/shared/model/categories_model.dart';
import 'package:food_delivery_app/app/modules/product/model/product_model.dart';
import 'package:food_delivery_app/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  // static const String route = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 80,
        leading: InkWell(
          onTap: () => ZoomDrawer.of(context)!.toggle(),
          child: Row(
            children: [
              SizedBox(width: 35.w),
              Container(
                width: 45.w,
                height: 48.h,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: greyLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset('assets/icons/dash.png'),
              ),
            ],
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: red,
              size: 18,
            ),
            SizedBox(width: 10.w),
            Text(
              'California, US',
              style: poppins.copyWith(
                fontSize: 20.sp,
                color: black,
              ),
            ),
            SizedBox(width: 10.w),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: orange,
              size: 18,
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Container(
                width: 45.w,
                height: 48.h,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: greyLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset('assets/profile.png'),
              ),
              SizedBox(width: 35.w),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: orangeTwo,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: poppins.copyWith(
                                fontSize: 23.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: 'The Fastest In Delivery ',
                                  style: poppins.copyWith(color: black),
                                ),
                                TextSpan(
                                  text: 'Food',
                                  style: poppins.copyWith(color: red),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 13.h),
                          Container(
                            decoration: BoxDecoration(
                              color: red,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 12,
                            ),
                            child: Text(
                              'Order Now',
                              style: poppins.copyWith(
                                color: white,
                                fontSize: 17.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/courier.png',
                      width: 140,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                'Categories',
                style: poppins.copyWith(
                    color: black, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10.h),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(
                    categories.length,
                    (index) => Padding(
                      padding: index == 0
                          ? const EdgeInsets.only(left: 35, right: 20)
                          : index == categories.length - 1
                              ? const EdgeInsets.only(right: 35)
                              : const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentCategory = index;
                          });
                        },
                        child: CategoriesItems(
                          category: categories[index],
                          selected: currentCategory == index,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Now',
                    style: poppins.copyWith(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'View All',
                        style: poppins.copyWith(
                          color: orange,
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(width: 7.w),
                      Container(
                        padding: const EdgeInsets.all(3),
                        height: 23.h,
                        width: 22.w,
                        decoration: BoxDecoration(
                          color: orange,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: white,
                          size: 8,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 10),
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  ...List.generate(
                    products.length,
                    (index) => Padding(
                      padding: index == 0
                          ? const EdgeInsets.only(left: 35, right: 20)
                          : const EdgeInsets.only(right: 35),
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          ProductDetail.route,
                          arguments: products[index],
                        ),
                        child: ProductsItems(
                          product: products[index],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
