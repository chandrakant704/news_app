import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/view/search_screen.dart';
import 'package:news_app/view/widget/list_view_widget.dart';
import '../controller/article_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Headlines',
            style: TextStyle(color: kBlack, fontSize: 15.sp)),
        backgroundColor: appbarColorLight,
        actions: [
          GestureDetector(
            onTap: () {
              //navigate to search page
              Get.to(SearchScreen());
            },
            child: Icon(
              Icons.search,
              color: kBlack,
              size: 7.w,
            ),
          ),
          SizedBox(width: 5.w),
          Container(
            child: Icon(
              Icons.menu_sharp,
              color: kBlack,
              size: 7.w,
            ),
          ),
          SizedBox(width: 5.w),
        ],
      ),
      body: Obx(() {
        if (articleController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: appbarColorLight,
              strokeWidth: 1.w,
            ),
          );
        } else if (articleController.articles.isNotEmpty) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.w,
              childAspectRatio: 0.75,
            ),
            itemCount: articleController.articles.length,
            itemBuilder: (context, index) {
              // Create a listview widget for showing the articles data
              return listViewWidget(articleController.articles[index], context);
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
