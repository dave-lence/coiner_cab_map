
import 'package:coiner_assessment/screens/error_screen.dart';
import 'package:coiner_assessment/screens/history_details_screen.dart';
import 'package:coiner_assessment/screens/history_screen.dart';
import 'package:coiner_assessment/screens/support_screen.dart';
import 'package:flutter/material.dart';

import 'screens/profile_screen.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ProfileScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      );
    case SupportScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SupportScreen(),
      );
    case HistoryScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HistoryScreen(),
      );

    case HistoryDetailsScreen.routeName:
        final searchedLocation = settings.arguments as String;
        final time = settings.arguments as String;

      return MaterialPageRoute(
        builder: (context) =>  HistoryDetailsScreen(searchedLocation: searchedLocation, time: time,),
      );
    
   

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This page doesn\'t exist'),
        ),
      );
  }
}
