import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/app_color.dart';
import '../model/top_headline_model.dart';
import 'package:sizer/sizer.dart';

class NewsDetails extends StatefulWidget {
  final Articles? article;

  const NewsDetails({super.key, required this.article});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Details',
            style: TextStyle(color: kBlack, fontSize: 15.sp)),
        backgroundColor: appbarColorLight,
      ),
      body: Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.article?.urlToImage != null
                ? Container(
                    height: 30.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              NetworkImage(widget.article!.urlToImage! ?? 'NA'),
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
                widget.article?.title! ?? 'NA',
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
                'Author: ${widget.article?.author ?? 'NA'}',
                style: TextStyle(
                  fontSize: 11.sp,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(1.w),
              child: Text(
                widget.article?.description ?? "",
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
