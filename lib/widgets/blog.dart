// ignore_for_file: prefer_const_constructors

import 'package:diginews/screens/article.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogContainer extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String content;
  final String url;
  const BlogContainer(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.content,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ArticlePage(), arguments: [url]);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(imageUrl),
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              content,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
