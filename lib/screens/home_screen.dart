import 'dart:ui';

import 'package:fitstart/model/gyms.dart';
import 'package:fitstart/screens/widgets/categories_card.dart';
import 'package:fitstart/screens/widgets/gym_categories.dart';
import 'package:fitstart/screens/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:fitstart/core/assets/app_assets.dart';
import 'package:fitstart/core/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  bool isButtonHover = false;

  @override
  Widget build(BuildContext context) {
    double gridItemWidth =
        (MediaQuery.of(context).size.width -
            (12 *
                (MediaQuery.of(context).size.width < 660
                    ? 1
                    : MediaQuery.of(context).size.width < 970
                    ? 2
                    : 3))) /
        (MediaQuery.of(context).size.width < 660
            ? 1
            : MediaQuery.of(context).size.width < 970
            ? 2
            : 3);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(), // Header Section
            SizedBox(height: 20),

            gymCategories(), // Gym Categories Section
            SizedBox(height: 25),

            Text(
              "GYM",
              style: TextStyle(
                color: AppColors.darkGrey,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: GridView.builder(
                padding: EdgeInsets.all(12),
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: gyms.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).size.width < 660
                          ? 1
                          : MediaQuery.of(context).size.width < 970
                          ? 2
                          : 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) {
                  Gym gym = gyms[index];
                  return categoryCard(
                    title: gym.name,
                    rating: gym.rating,
                    url: gym.url,
                    gymLocation: gym.location,
                    price: gym.price,
                    blurCardWidth: gridItemWidth,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Gym Category Card Widget
}
