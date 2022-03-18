import 'package:diginews/models/article.dart';
import 'package:diginews/models/blog.dart';
import 'package:diginews/service/service.dart';
import 'package:get/get.dart';

class HeadlinesController extends GetxController {
  List newsData = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  Future getNews() async {
    try {
      isLoading.value = true;
      var data = await ApiManager.getNews();
      if (data != null) {
        newsData = data["articles"];
      }
    } catch (e) {
      print("Failed to fetch data");
    } finally {
      isLoading.value = false;
    }
  }
}
