import 'dart:ui';

import 'package:fitstart/model/gyms.dart';
import 'package:flutter/material.dart';
import 'package:fitstart/core/assets/app_assets.dart';
import 'package:fitstart/core/theme/app_colors.dart';

Widget categoryCard({
  required String title,
  required int rating,
  required String url,
  String? gymLocation,
  String? price,
  double? blurCardWidth,
}) {
  bool isHovering = false;

  return StatefulBuilder(
    builder: (context, setState) {
      return LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = MediaQuery.of(context).size.width;
          double cardWidth = screenWidth > 800 ? 700 : 400;
          double cardHeight = screenWidth > 800 ? 300 : 200;

          return MouseRegion(
            onEnter: (_) => setState(() => isHovering = true),
            onExit: (_) => setState(() => isHovering = false),
            child: Container(
              height: cardHeight,
              width: cardWidth,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.black.withOpacity(0.3),
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 10,
                          ),
                          width: blurCardWidth ?? cardWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: TextStyle(
                                      fontSize:
                                          constraints.maxWidth > 800 ? 20 : 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  if (gymLocation != null)
                                    Text(
                                      gymLocation,
                                      style: TextStyle(
                                        fontSize:
                                            constraints.maxWidth > 800
                                                ? 14
                                                : 10,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  Row(
                                    children: List.generate(
                                      5,
                                      (index) => Icon(
                                        Icons.star,
                                        color:
                                            rating > index
                                                ? AppColors.gold
                                                : AppColors.lightGrey,
                                        size:
                                            constraints.maxWidth > 800
                                                ? 22
                                                : 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  if (price != null)
                                    Text(
                                      "₹ $price",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    )
                                  else
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 14,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            isHovering
                                                ? AppColors.green
                                                : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: AppColors.green,
                                          width: 2,
                                        ),
                                      ),
                                      child: Text(
                                        "Apply",
                                        style: TextStyle(
                                          color:
                                              isHovering
                                                  ? AppColors.darkGrey
                                                  : AppColors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
