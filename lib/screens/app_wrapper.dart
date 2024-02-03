import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:simpleset_app_v2/screens/home_screen.dart';
import 'package:simpleset_app_v2/screens/search_screen.dart';
import 'package:simpleset_app_v2/screens/analytics_screen.dart';

/*
  Wrapper view for the three top level screens (Home, Search, Analytics) in the DOM 
  Maintains the main bottom navigation bar
*/
class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  // Controls which screen to display
  int screenIndex = 0;

  // Top level screens
  final screens = [
    const HomeScreen(),
    const SearchScreen(),
    const AnalyticsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Indexed stack used so that the state of the pages is maintained
      body: IndexedStack(
        index: screenIndex,
        children: screens,
      ),

      // Use of container around GNav navigation bar to space navigation bar away from bottom of screen while maintaining continuity in color
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            border: Border(
                top: BorderSide(
                    width: 0.5, color: Theme.of(context).colorScheme.outline))),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        // Imported GNav bottom navigation bar
        child: GNav(
            gap: 8,
            backgroundColor: Theme.of(context).colorScheme.primary,
            tabs: [
              GButton(
                icon: Icons.home_rounded,
                text: 'Home',
                onPressed: () {
                  setState(() {
                    screenIndex = 0;
                  });
                },
              ),
              GButton(
                icon: Icons.search_rounded,
                text: 'Search',
                onPressed: () {
                  setState(() {
                    screenIndex = 1;
                  });
                },
              ),
              GButton(
                  icon: Icons.bar_chart_rounded,
                  text: 'Analytics',
                  onPressed: () => {
                        setState(() {
                          screenIndex = 2;
                        }),
                      }),
            ]),
      ),
    );
  }
}
