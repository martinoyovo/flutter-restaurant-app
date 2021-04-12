import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_location_service.dart';
import 'package:food_mobile/pages/address/address_edit.dart';
import 'package:food_mobile/pages/address/address_edit2.dart';
import 'package:food_mobile/pages/address/location_address.dart';
import 'package:food_mobile/pages/address/location_choose_city.dart';
import 'package:food_mobile/pages/auth/confirm_password.dart';
import 'package:food_mobile/pages/auth/sign_in.dart';
import 'package:food_mobile/pages/auth/sign_up.dart';
import 'file:///C:/Users/tino.co/Documents/food_mobile/lib/pages/details/choose_dessert.dart';
import 'package:food_mobile/pages/details/details_add_promotion_code.dart';
import 'package:food_mobile/pages/details/details_change_payment.dart';
import 'package:food_mobile/pages/details/details_infos.dart';
import 'package:food_mobile/pages/details/details_my_order.dart';
import 'package:food_mobile/pages/details/details_search_in_restaurant.dart';
import 'package:food_mobile/pages/driver/order/message/order_message.dart';
import 'package:food_mobile/pages/driver/order/order_details.dart';
import 'package:food_mobile/pages/driver/order/track_order.dart';
import 'package:food_mobile/pages/driver/order/tracking.dart';
import 'package:food_mobile/pages/driver/widgets/f_bottom_navigation.dart';
import 'package:food_mobile/pages/home.dart';
import 'package:food_mobile/pages/onboarding.dart';
import 'package:food_mobile/pages/saved/see_all.dart';
import 'package:food_mobile/pages/search/search_in_restaurant.dart';
import 'package:food_mobile/root.dart';
import 'package:food_mobile/pages/search/search.dart';
import 'package:food_mobile/pages/search/search_filter.dart';
import 'package:food_mobile/pages/search/search_items.dart';
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
      child: MaterialApp(
        title: 'Food mobile',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: GoogleFonts.openSans(fontSize: 16),
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
          accentColor: primaryColor
        ),
        debugShowCheckedModeBanner: false,
          initialRoute: '/root',
          routes: {
            "/home": (context) => Home(),
            "/root": (context) => Root(),

            '/': (context) => Onboarding(),
            "/signIn": (context) => SignIn(),
            "/signUp": (context) => SignUp(),
            "/confirmPassword": (context) => ConfirmPassword(),

            "/chooseDessert": (context) => ChooseDessert(),
            "/searchInRestaurant": (context) => SearchInRestaurant(),
            "/detailsSearchInRestaurant": (context) => DetailsSearchInRestaurant(),

            "/searchItems": (context) => SearchItems(),
            "/search": (context) => Search(),
            "/searchFilter": (context) => SearchFilter(),

            "/locationChooseCity": (context) => LocationChooseCity(),
            "/locationAddress": (context) => LocationAddress(),
            "/editAddress": (context) => AddressEdit(),
            "/editAddress2": (context) => AddressEdit2(),

            "/detailsInfos": (context) => DetailsInfos(),
            "/detailsMyOrder": (context) => DetailsMyOrder(),
            "/detailsChangePayment": (context) => DetailsChangePayment(),
            "/detailsAddPromotionCode": (context) => DetailsAddPromotionCode(),

            "/orderMessage": (context) => OrderMessage(),
            "/orderDetails": (context) => OrderDetails(),
            "/trackerOrder": (context) => TrackOrder(),
            "/tracking": (context) => Tracking(),
            "/driver": (context) => FBottomNavigationBar(),


            "/seeAll": (context) => SeeAll(),
          },
      ),
    );
  }
}
