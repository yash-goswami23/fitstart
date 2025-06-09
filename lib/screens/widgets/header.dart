import 'package:flutter/material.dart';
import 'package:fitstart/core/assets/app_assets.dart';
import 'package:fitstart/core/theme/app_colors.dart';

Widget header() {
  return LayoutBuilder(
    builder: (context, constraints) {
      bool isDesktop = constraints.maxWidth > 800;
      return Container(
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Image.asset(AppAssets.logowithoutbgweb, height: 80, width: 80),
            SizedBox(width: isDesktop ? 30 : 15),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                margin: EdgeInsets.only(right: 35),
                decoration: BoxDecoration(
                  color: AppColors.darkGrey,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColors.green,
                      size: isDesktop ? 28 : 22,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        // controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search...",
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize: isDesktop ? 18 : 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
