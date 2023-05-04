import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/app/modules/product/model/product_model.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatefulWidget {
  static const String route = 'product-detail';

  const ProductDetail({
    super.key,
  });
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProductModel;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 80.w,
        leading: Row(
          children: [
            SizedBox(width: 35.w),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 45.w,
                height: 50.h,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: black,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Container(
                width: 45.w,
                height: 50.h,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.more_horiz_rounded,
                  color: black,
                  size: 18,
                ),
              ),
              SizedBox(width: 35.w),
            ],
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: orange.withAlpha(150),
            child: Image.asset(
              'assets/food_pattern.png',
              repeat: ImageRepeat.repeatY,
              color: orange,
            ),
          ),
          Container(
            height: size.height * 0.75,
            width: size.width,
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.only(left: 35, right: 35, bottom: 25),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              // reverse: true,
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 70.h),
                  Hero(
                    tag: args.name,
                    child: Image.asset(
                      'assets/${args.imageDetail}',
                      width: 230.w,
                      height: 320.h,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    height: 50.h,
                    width: 110.w,
                    decoration: BoxDecoration(
                      color: red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (count > 1) {
                                  count--;
                                }
                              });
                            },
                            child: const Icon(Icons.remove, color: white),
                          ),
                          SizedBox(width: 15.w),
                          Text(
                            count.toString(),
                            style: poppins.copyWith(
                              color: white,
                              fontSize: 22.sp,
                            ),
                          ),
                          SizedBox(width: 15.w),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                count++;
                              });
                            },
                            child: const Icon(Icons.add, color: white),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            args.name,
                            style: poppins.copyWith(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                args.special.name,
                                style: poppins.copyWith(
                                  letterSpacing: 1.1,
                                  fontSize: 14.sp,
                                  color: black.withOpacity(0.7),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Image.asset(
                                'assets/icons/${args.special.image}',
                                width: 14.w,
                              )
                            ],
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          style: poppins.copyWith(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: '\$',
                              style: poppins.copyWith(
                                color: red,
                                fontSize: 18.sp,
                              ),
                            ),
                            TextSpan(
                              text: '${args.price}',
                              style: poppins.copyWith(
                                fontSize: 30.sp,
                                color: black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 35.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/star.png',
                            width: 22.w,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            args.rate.toString(),
                            style: poppins.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/fire.png',
                            width: 22.w,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '150 Kcal',
                            style: poppins.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/time.png',
                            width: 22.w,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '5-10 Min',
                            style: poppins.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  ReadMoreText(
                    args.description,
                    style: poppins.copyWith(
                      fontSize: 17.sp,
                      color: black,
                      height: 1.5,
                    ),
                    trimMode: TrimMode.Length,
                    trimLength: 100,
                    trimLines: 3,
                    trimCollapsedText: 'Read More',
                    trimExpandedText: 'Read Less',
                    colorClickableText: red,
                    moreStyle: poppins.copyWith(
                      fontWeight: FontWeight.bold,
                      color: red,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: 85.h,
                    onPressed: () {},
                    color: red,
                    child: Center(
                      child: Text(
                        'Add to Cart',
                        style: poppins.copyWith(
                          color: white,
                          fontSize: 23.sp,
                          letterSpacing: 1.3,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
