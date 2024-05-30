import 'package:flutter/material.dart';
import 'package:news_app/view/widget/search_data_listview.dart';
import 'package:sizer/sizer.dart';
import '../controller/news_search_controller.dart';
import '../services/api_services.dart';
import '../model/search_model.dart' as search;
import 'package:get/get.dart';
import '../utils/app_color.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final NewsSearchController newsSearchController =
      Get.put(NewsSearchController());
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColorLight,
        automaticallyImplyLeading: false,
        title: Container(
            decoration: BoxDecoration(
                color: kWhite, borderRadius: BorderRadius.circular(3.w)),
            child: TextField(
                controller: searchController,
                keyboardType: TextInputType.text,
                onSubmitted: (query) {
                  newsSearchController.getSearchDetails(query);
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: kBlack,
                      size: 7.w,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: kBlack,
                        size: 7.w,
                      ),
                      onPressed: () {
                        //searchController.clear();
                        newsSearchController.articles.clear();
                        Navigator.pop(context);
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none))),
      ),
      body: Obx(() {
        if (newsSearchController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: appbarColorLight,
              strokeWidth: 1.w,
            ),
          );
        } else if (newsSearchController.articles.isNotEmpty) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.w,
              childAspectRatio: 0.75,
            ),
            itemCount: newsSearchController.articles.length,
            itemBuilder: (context, index) {
              return searchlistViewWidget(
                  newsSearchController.articles[index], context);
            },
          );
        } else {
          return Center(
            child: Text(
              'No results found',
              style: TextStyle(color: Colors.black, fontSize: 12.sp),
            ),
          );
        }
      }),
    );
  }
}
