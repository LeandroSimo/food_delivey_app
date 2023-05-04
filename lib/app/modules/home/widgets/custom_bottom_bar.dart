import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/utils/constants.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      color: white,
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(
              Icons.home_filled,
              color: red,
              size: 30,
            ),
            const Icon(
              Icons.favorite_outline_rounded,
              color: grey,
              size: 30,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: red,
              ),
              child: const Icon(
                Icons.search,
                color: white,
              ),
            ),
            const Icon(
              Icons.notifications_outlined,
              color: grey,
              size: 30,
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  color: grey,
                  size: 30,
                ),
                Positioned(
                  top: -5,
                  right: -1,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '4',
                      style: poppins.copyWith(
                        color: white,
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
