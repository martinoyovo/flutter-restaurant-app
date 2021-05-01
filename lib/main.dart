import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_location_service.dart';
import 'package:food_mobile/core/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final locationService = FLocationService();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create:(_) =>  locationService.getLocation(),
      initialData: null,
      child: MaterialApp(
        title: 'Food mobile',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: GoogleFonts.openSans(fontSize: 16),
            hintStyle: GoogleFonts.openSans(fontSize: 16, color: Colors.red),
            errorStyle: GoogleFonts.openSans(fontSize: 13),
          ),
          textTheme: TextTheme(
            headline6: GoogleFonts.openSans(fontSize: 21, fontWeight: FontWeight.w600),
            headline5: GoogleFonts.openSans(fontSize: 17),
            headline4: GoogleFonts.openSans(fontSize: 18, color: primaryColor),
            headline3: GoogleFonts.openSans(fontSize: 16, color: Colors.black),
            bodyText1: GoogleFonts.openSans(fontSize: 16),
            bodyText2: GoogleFonts.openSans(fontSize: 16),
            subtitle1: GoogleFonts.openSans(fontSize: 13),
            subtitle2: GoogleFonts.openSans(fontSize: 14),
          ),
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.black87,
            ),
          ),
          tabBarTheme: TabBarTheme(
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: GoogleFonts.openSans(fontSize: 16, color: primaryColor),
            labelColor: primaryColor,
            unselectedLabelColor: Colors.grey.shade700,
            unselectedLabelStyle: GoogleFonts.openSans(fontSize: 16, color: Colors.grey.shade700),
          ),
          primaryColor: primaryColor,
          accentColor: Colors.white
        ),
        debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: fRoutes,
      ),
    );
  }
}
