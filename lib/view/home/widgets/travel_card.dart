import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/view/home/widgets/readmore.dart';
import 'package:travel_app/view_model/home_view_model.dart';

import '../../../core/theme.dart';

class TravelCard extends StatelessWidget {
  final String image, description;
  const TravelCard({
    super.key,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: AppTheme.accentColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Discount Badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  image,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 50.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    ),
                    color: AppTheme.primaryColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Save 50%',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          size: 24,
                          Icons.local_offer,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Details Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DETAILS',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                ReadMoreText(
                  text: description,
                ),
              ],
            ),
          ),
          // Learn More Button
          homeViewModel.isNavBarVisible
              ? const SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    homeViewModel.isFirstPage
                        ? const SizedBox(width: 100)
                        : TextButton(
                            onPressed: () {
                              homeViewModel.toggleFirstPage();
                            },
                            style: TextButton.styleFrom().copyWith(
                              foregroundColor:
                                  WidgetStateProperty.all(AppTheme.iconColor),
                            ),
                            child: const Text("Preview",
                                style: TextStyle(fontSize: 20)),
                          ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom().copyWith(
                        backgroundColor: WidgetStateProperty.all(
                          AppTheme.buttonBgColor,
                        ),
                        foregroundColor: WidgetStateProperty.all(Colors.black),
                        shadowColor: WidgetStateProperty.all(Colors.black),
                        elevation: WidgetStateProperty.all(10),
                      ),
                      child: const Text("Learn More"),
                    ),
                    const Spacer(),
                    // text button
                    homeViewModel.isFirstPage
                        ? TextButton(
                            onPressed: () {
                              homeViewModel.toggleFirstPage();
                            },
                            style: TextButton.styleFrom().copyWith(
                              foregroundColor: WidgetStateProperty.all(
                                AppTheme.iconColor,
                              ),
                            ),
                            child: const Text("Next",
                                style: TextStyle(fontSize: 20)),
                          )
                        : const SizedBox(width: 100),
                  ],
                )
        ],
      ),
    );
  }
}
