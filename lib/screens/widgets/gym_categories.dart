import 'dart:ui';

import 'package:fitstart/model/gyms.dart';
import 'package:fitstart/screens/widgets/categories_card.dart';
import 'package:flutter/material.dart';
import 'package:fitstart/core/assets/app_assets.dart';
import 'package:fitstart/core/theme/app_colors.dart';

Widget gymCategories() {
  return LayoutBuilder(
    builder: (context, constraints) {
      bool isDesktop = constraints.maxWidth > 800;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 25),
          Text(
            "GYM Membership Categories",
            style: TextStyle(
              color: AppColors.darkGrey,
              fontSize: isDesktop ? 30 : 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                categoryCard(
                  title: "Gold Membership",
                  rating: 3,
                  url: AppAssets.gymimgUrl1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: categoryCard(
                    title: "Premium Membership",
                    rating: 4,
                    url: AppAssets.gymimgUrl2,
                  ),
                ),
                categoryCard(
                  title: "Elite Membership",
                  rating: 5,
                  url: AppAssets.gymimgUrl3,
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
