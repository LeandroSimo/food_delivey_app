import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/shared/model/categories_model.dart';
import 'package:food_delivery_app/utils/constants.dart';

class CategoriesItems extends StatelessWidget {
  final CategoriesModel category;
  final bool selected;

  const CategoriesItems({
    Key? key,
    required this.category,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.only(left: 16, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: selected ? red : greyLight,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration:
                const BoxDecoration(color: white, shape: BoxShape.circle),
            child: Image.asset(
              'assets/category/${category.image}',
              width: 18,
              height: 18,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            category.name,
            style: poppins.copyWith(
              color: selected ? white : black,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
