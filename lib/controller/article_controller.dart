import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import '../model/top_headline_model.dart';
import '../services/api_services.dart';

class ArticleController extends GetxController {
  var isLoading = true.obs;
  var articles = <Articles>[].obs;
  final ApiService apiService = ApiService();
  Rx<ThemeMode> currentTheme = ThemeMode.system.obs;

  @override
  void onInit() {
    getArticlesList();
    super.onInit();
  }

  void getArticlesList() async {
    try {
      isLoading(true);
      var articlesResult = await apiService.getArticle();
      if (articlesResult != null) {
        articles.assignAll(articlesResult);
      }
    } finally {
      isLoading(false);
    }
  }
}
