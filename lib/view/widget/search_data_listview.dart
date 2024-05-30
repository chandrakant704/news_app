import 'package:flutter/material.dart';
import 'package:news_app/view/search_details.dart';
import 'package:sizer/sizer.dart';
import '../../model/search_model.dart' as search;
import 'package:get/get.dart';
import '../../utils/app_color.dart';

searchlistViewWidget(search.Articles article, BuildContext context) {
  return InkWell(
    onTap: () {
      //navigate to search details page
      Get.to(SearchDetails(searchArticle: article!));
    },
    child: Container(
      margin: EdgeInsets.all(2.w),
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(3.w),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 3.w,
            ),
          ]),
      child: Stack(
        children: [
          //if url image is not null then show image else show static image
          article.urlToImage != null
              ? Container(
                  height: 30.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.w),
                    image: DecorationImage(
                        image: NetworkImage(article.urlToImage!),
                        fit: BoxFit.cover),
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
          Positioned(
            bottom: 2.h,
            left: 2.w,
            right: 2.w,
            child: Text(
              article.title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kWhite,
                overflow: TextOverflow.ellipsis,
                fontSize: 12.sp,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
