import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:laza/features/home/presentation/views/home_view.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key, required this.email});
  final String email;

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int currentIndex = 0;
  List views = [
    HomeView(),
    Container(
      color: Colors.green,
      width: double.infinity,
    ),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: views.elementAt(currentIndex),
      bottomNavigationBar: GNav(
        onTabChange: (value) {
          currentIndex = value;
          setState(() {});
        },
        tabBackgroundColor:
            Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
        activeColor: Theme.of(context).colorScheme.tertiary,
        tabMargin: const EdgeInsets.all(10),
        gap: 8,
        color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
        tabBorderRadius: 15,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.all(40),
        curve: Curves.easeInQuart,
        // ignore: prefer_const_literals_to_create_immutables
        tabs: [
          const GButton(
            icon: Icons.home,
            text: 'Home',
            padding: EdgeInsets.all(15),
          ),
          const GButton(
            icon: Icons.favorite,
            text: 'Favourite',
            padding: EdgeInsets.all(15),
          ),
          const GButton(
            icon: Icons.shopping_cart,
            text: 'Cart',
            padding: EdgeInsets.all(15),
          ),
          const GButton(
            icon: Icons.wallet,
            text: 'Payment',
            padding: EdgeInsets.all(15),
          ),
        ],
      ),
    );
  }
}
