import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_dm/category_dm.dart';
import 'package:news_app/ui/utils/app_colors.dart';

class CategoriesWidget extends StatelessWidget {

  final CategoryDM categoryDM ;
  // final Radius radius = const Radius.circular(24);

  const CategoriesWidget({super.key,required this.categoryDM});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
            categoryDM.id,
          style:const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
      ),
    );
  }
}
