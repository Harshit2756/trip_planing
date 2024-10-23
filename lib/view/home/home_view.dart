import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/view/home/widgets/search_bar.dart';
import 'package:travel_app/view/home/widgets/travel_card.dart';

import '../../core/app_media.dart';
import '../../core/theme.dart';
import '../../view_model/home_view_model.dart';
import '../wigets/custom_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              foregroundImage: AssetImage(AppMedia.userAvatar),
              radius: 25,
            ),
            const Spacer(),
            Text(
              "Hello, Sourany!",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Card(
              shape: const CircleBorder(),
              shadowColor: AppTheme.primaryColor.withOpacity(0.5),
              elevation: 5,
              child: IconButton(
                icon: const Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SearchBars(),
          ),
          AnimatedCrossFade(
              firstChild: const TravelCard(
                description:
                    "Thailand, one of Asia's most popular travel destinations,has been badly hit by a pandemic-induced tourism slump, with about 200,000 arrivals last year, compared to nearly 40 million in 2019.",
                image: AppMedia.travelImage1,
              ),
              secondChild: const TravelCard(
                description:
                    "There is no other place like Bali in this world. A magical mix of culture, people, nature, activities, weather, culinary delights, nightlife and many other interesting things that can make your stay unforgettable.",
                image: AppMedia.travelImage2,
              ),
              crossFadeState: homeViewModel.isFirstPage
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 500)),
        ],
      ),
      floatingActionButton: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height:
            homeViewModel.isNavBarVisible ? kBottomNavigationBarHeight : 0.0,
        child: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.black),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height:
            homeViewModel.isNavBarVisible ? kBottomNavigationBarHeight : 0.0,
        child: const CustomBottomNavBar(),
      ),
    );
  }
}
