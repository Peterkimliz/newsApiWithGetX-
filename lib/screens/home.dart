// ignore_for_file: prefer_const_constructors

import 'package:diginews/controllers/headlines.dart';
import 'package:diginews/widgets/blog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HeadlinesController headlinesController =
      Get.put(HeadlinesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text("Digi", style: TextStyle(color: Colors.black)),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///blog container
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              margin: EdgeInsets.only(top: 16.0),
              child: Obx(() {
                if (headlinesController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      itemCount: headlinesController.newsData.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return BlogContainer(
                            title: headlinesController.newsData[index]["title"],
                            imageUrl: headlinesController.newsData[index]
                                ["urlToImage"],
                            content: headlinesController.newsData[index]
                                ["description"],
                            url: headlinesController.newsData[index]["url"]);
                      });
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
