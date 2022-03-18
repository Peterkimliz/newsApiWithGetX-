import 'package:diginews/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "News App",
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
      initialRoute: "/home",
    );
  }
}
