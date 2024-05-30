import 'package:get/get.dart';
import '../model/search_model.dart' as search;
import '../services/api_services.dart';

class NewsSearchController extends GetxController {
  var isLoading = false.obs;
  var articles = <search.Articles>[].obs;
  var searchQuery = ''.obs;
  final ApiService apiService = ApiService();

  void getSearchDetails(String query) async {
    try {
      isLoading(true);
      searchQuery(query);
      var searchResult = await apiService.getSearchNews(query);
      if (searchResult != null) {
        articles.assignAll(searchResult);
      }
    } finally {
      isLoading(false);
    }
  }
}
