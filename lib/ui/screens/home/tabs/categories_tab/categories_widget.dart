import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_dm/category_dm.dart';
import 'package:news_app/ui/utils/app_colors.dart';

class CategoriesWidget extends StatelessWidget {

  final CategoryDM categoryDM ;
  final Radius radius = const Radius.circular(24);

  const CategoriesWidget({super.key,required this.categoryDM});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:categoryDM.backgroundColor ,
        borderRadius: BorderRadius.only(
            topLeft: radius,
            topRight: radius,
            bottomLeft: categoryDM.isLeftSided? Radius.zero : radius,
            bottomRight: !categoryDM.isLeftSided? Radius.zero : radius,
        ),
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(categoryDM.imagePath , height: MediaQuery.of(context).size.height *.12,),
            const SizedBox(height: 8,),
            Text(
              categoryDM.title,
              style:const TextStyle(
                color: AppColors.white
              ),
            ),
          ],
        ),
    );
  }
}
