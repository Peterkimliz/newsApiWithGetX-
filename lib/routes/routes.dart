import 'package:diginews/screens/article.dart';
import 'package:diginews/screens/category.dart';
import 'package:diginews/screens/home.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(name: "/home", page: () => Home()),
    GetPage(name: "/category", page: () => Category()),
    GetPage(name: "/article", page: () => ArticlePage())
  ];
}
