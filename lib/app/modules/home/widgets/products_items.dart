import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/app/modules/product/model/product_model.dart';
import 'package:food_delivery_app/utils/constants.dart';

class ProductsItems extends StatelessWidget {
  final ProductModel product;
  const ProductsItems({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 215.h,
          width: size.width / 2.1,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: greyLight,
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(2, 5),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: product.name,
                child: Image.asset(
                  'assets/${product.imageCard}',
                  width: 120.w,
                  height: 110.h,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 22.h),
              Text(
                product.name,
                maxLines: 1,
                style: poppins.copyWith(
                  color: black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.special.name,
                    style: poppins.copyWith(
                      letterSpacing: 1.1,
                      fontSize: 14.sp,
                      color: black.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Image.asset(
                    'assets/icons/${product.special.image}',
                    width: 14.w,
                  )
                ],
              ),
              SizedBox(height: 15.h),
              RichText(
                text: TextSpan(
                  style: poppins.copyWith(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: '\$',
                      style: poppins.copyWith(
                        color: red,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      text: '${product.price}',
                      style: poppins.copyWith(
                        fontSize: 22.sp,
                        color: black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 2,
          right: 5,
          child: Container(
            width: 22,
            height: 22,
            padding: const EdgeInsets.all(5),
            decoration:
                const BoxDecoration(color: greyLight, shape: BoxShape.circle),
            child: Image.asset('assets/icons/fire.png'),
          ),
        )
      ],
    );
  }
}
