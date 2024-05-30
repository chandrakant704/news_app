import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../model/search_model.dart' as search;
import '../utils/app_color.dart';

class SearchDetails extends StatefulWidget {
  final search.Articles? searchArticle;

  const SearchDetails({super.key, required this.searchArticle});

  @override
  State<SearchDetails> createState() => _SearchDetailsState();
}

class _SearchDetailsState extends State<SearchDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Details',
            style: TextStyle(color: kBlack, fontSize: 15.sp)),
        backgroundColor: appbarColorLight,
      ),
      body: Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.searchArticle?.urlToImage != null
                ? Container(
                    height: 30.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              widget.searchArticle!.urlToImage! ?? 'NA'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(3.w),
                    ),
                  )
                : Container(
                    height: 30.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.w),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://www.eclosio.ong/wp-content/uploads/2018/08/default.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
            SizedBox(height: 1.h),
            Container(
              padding: EdgeInsets.all(1.w),
              child: Text(
                widget.searchArticle?.title! ?? 'NA',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(height: 1.h),
            Container(
              padding: EdgeInsets.all(1.w),
              child: Text(
                'Author: ${widget.searchArticle?.author ?? 'NA'}',
                style: TextStyle(
                  fontSize: 11.sp,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(1.w),
              child: Text(
                widget.searchArticle?.description ?? "",
                style: TextStyle(
                  fontSize: 11.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
