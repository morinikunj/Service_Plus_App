import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  final PageController pageController = PageController();
  int activePage = 0;

  final List<Map<String, dynamic>> pages = [
    {
      'color': '#ffe24e',
      'title': 'Hmmm, Healthy food',
      'image': 'assets/images/image1.png',
      'description':
          "A variety of foods made by the best chef. Ingredients are easy to find, all delicious flavors can only be found at cookbunda",
      'skip': true
    },
    {
      'color': '#31b77a',
      'title': 'Fresh Drinks, Stay Fresh',
      'image': 'assets/images/image3.png',
      'description':
          'Not all food, we provide clear healthy drink options for you. Fresh taste always accompanies you',
      'skip': true
    },
    {
      'color': '#a3e4f1',
      'title': 'Let\'s Cooking',
      'image': 'assets/images/image2.png',
      'description':
          'Are you ready to make a dish for your friends or family? create an account and cooks',
      'skip': false
    },
  ];

  void onNextPage() {
    if (activePage < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    }
  }

  void onPageChanged(page) {
    activePage = page;
    update(["intro_page"]);
  }
}
