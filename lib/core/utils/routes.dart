import 'package:restaurant_app/pages/address/address_edit.dart';
import 'package:restaurant_app/pages/address/address_edit2.dart';
import 'package:restaurant_app/pages/address/location_address.dart';
import 'package:restaurant_app/pages/address/location_choose_city.dart';
import 'package:restaurant_app/pages/auth/confirm_password.dart';
import 'package:restaurant_app/pages/auth/sign_in.dart';
import 'package:restaurant_app/pages/auth/sign_up.dart';
import 'package:restaurant_app/pages/details/choose_dessert.dart';
import 'package:restaurant_app/pages/details/details_add_promotion_code.dart';
import 'package:restaurant_app/pages/details/details_change_payment.dart';
import 'package:restaurant_app/pages/details/details_infos.dart';
import 'package:restaurant_app/pages/details/details_my_order.dart';
import 'package:restaurant_app/pages/details/details_my_order2.dart';
import 'package:restaurant_app/pages/details/details_search_in_restaurant.dart';
import 'package:restaurant_app/pages/driver/order/message/order_message.dart';
import 'package:restaurant_app/pages/driver/order/order_details.dart';
import 'package:restaurant_app/pages/driver/order/track_order.dart';
import 'package:restaurant_app/pages/driver/order/tracking.dart';
import 'package:restaurant_app/pages/home.dart';
import 'package:restaurant_app/pages/my_order/view_order.dart';
import 'package:restaurant_app/pages/onboarding.dart';
import 'package:restaurant_app/pages/profile/edit_profile.dart';
import 'package:restaurant_app/pages/profile/profile_screen.dart';
import 'package:restaurant_app/pages/saved/see_all.dart';
import 'package:restaurant_app/pages/search/search_in_restaurant.dart';
import 'package:restaurant_app/pages/search/search.dart';
import 'package:restaurant_app/pages/search/search_filter.dart';
import 'package:restaurant_app/pages/search/search_items.dart';
import 'package:restaurant_app/routes_page.dart';
import 'package:restaurant_app/widgets/f_bottom_navigation.dart';

var fRoutes = {
  "/home": (context) => Home(),
  "/root": (context) => RoutesPage(),

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
  "/detailsMyOrder2": (context) => DetailsMyOrder2(),
  "/detailsChangePayment": (context) => DetailsChangePayment(),
  "/detailsAddPromotionCode": (context) => DetailsAddPromotionCode(),

  "/orderMessage": (context) => OrderMessage(),
  "/orderDetails": (context) => OrderDetails(),
  "/trackOrder": (context) => TrackOrder(),
  "/tracking": (context) => Tracking(),
  "/driver": (context) => FBottomNavigationBar(),

  "/seeAll": (context) => SeeAll(),

  "/profileScreen": (context) => ProfileScreen(),
  "/editProfile": (context) => EditProfile(),

  "/nav": (context) => FBottomNavigationBar(),

  //ORDER
  "/viewOrder": (context) => ViewOrder(),
};