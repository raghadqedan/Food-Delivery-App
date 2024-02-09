import 'package:flutter/material.dart';
import 'package:food_delivary_app/utils/app_colors.dart';
import 'package:food_delivary_app/views/pages/home_page.dart';
import 'package:food_delivary_app/views/pages/favorites_page.dart';
import 'package:food_delivary_app/views/pages/profile_page.dart';

class CustomButtomNavbar extends StatefulWidget {
  const CustomButtomNavbar({super.key});

  @override
  State<CustomButtomNavbar> createState() => _CustomButtomNavbarState();
}

class _CustomButtomNavbarState extends State<CustomButtomNavbar> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: Center(child: Text('Inside Drawer'))),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
        title: Column(children: [
          Text(
            'Current Location ',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppColors.grey),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.location_on, color: AppColors.green),
            const SizedBox(
              width: 4,
            ),
            Text('Giza,Egypt', style: Theme.of(context).textTheme.titleLarge),
          ])
        ]),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'profile',
          ),
        ],
      ),
      body: <Widget>[
         const  HomePage(),
        FavoritesPage(),
        const ProfilePage(),
      ][currentPageIndex],
    );
  }
}
