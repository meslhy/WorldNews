import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_dm/category_dm.dart';
import 'package:news_app/ui/screens/home/tabs/categories_tab/categories_widget.dart';
import 'package:news_app/ui/utils/app_theme.dart';

class CategoriesTab extends StatelessWidget {
  final Function(CategoryDM) onCategoriesClick;
  const CategoriesTab({super.key , required this.onCategoriesClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
             width: MediaQuery.of(context).size.width * .5,
             child: Text(
                "Pick your category of interest",
              style: Theme.of(context).textTheme.labelLarge,
               maxLines: 2,
               softWrap: true,
          ),
           ),
          const SizedBox(height: 28,),
          Expanded(
            child: GridView.builder(
              itemCount: CategoryDM.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: .8,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: (){
                    onCategoriesClick(CategoryDM.categories[index]);
                  },
                    child: CategoriesWidget(
                        categoryDM: CategoryDM.categories[index],),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
