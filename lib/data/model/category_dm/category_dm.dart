
import 'package:flutter/material.dart';
class CategoryDM{
  String id;
  String title;
  String imagePath;
  bool isLeftSided;
  Color backgroundColor;

  CategoryDM({required this.id,
    required this.title,
    required this.imagePath,
    required this.isLeftSided,
    required this.backgroundColor});

  static List<CategoryDM> categories = [
    CategoryDM(id: "sports", title: "Sports",
        imagePath: "assets/images/sports.png", isLeftSided: true,
        backgroundColor: Colors.red[900]!),
    CategoryDM(id: "technology", title: "Technology",
        imagePath: "assets/images/Politics.png", isLeftSided: false,
        backgroundColor: Colors.blue[900]!),
    CategoryDM(id: "health", title: "Health",
        imagePath: "assets/images/health.png", isLeftSided: true,
        backgroundColor: Colors.pink),
    CategoryDM(id: "business", title: "Business",
        imagePath: "assets/images/bussines.png", isLeftSided: false,
        backgroundColor: Colors.orange[900]!),
    CategoryDM(id: "entertainment", title: "Entertainment",
        imagePath: "assets/images/environment.png", isLeftSided: true,
        backgroundColor: Colors.lightBlue),
    CategoryDM(id: "science", title: "Science",
        imagePath: "assets/images/science.png", isLeftSided: false,
        backgroundColor: Colors.yellow[500]!)
  ];
}