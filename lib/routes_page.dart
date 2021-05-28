import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/f_elevated_button.dart';

class RoutesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        physics: BouncingScrollPhysics(),
        children: [
          FElevatedButton(context, () {Navigator.pushNamed(context, "/");}, "Onboarding"),
          FElevatedButton(context, () {Navigator.pushNamed(context, "/home");}, "Home"),
          FElevatedButton(context, () {Navigator.pushNamed(context, "/signIn");}, "Sign In"),
          FElevatedButton(context, () {Navigator.pushNamed(context, "/signUp");}, "Sign Up"),
          FElevatedButton(context, () {Navigator.pushNamed(context, "/searchInRestaurant");}, "Search in Restaurant"),
          FElevatedButton(context, () {Navigator.pushNamed(context, "/detailsSearchInRestaurant");}, "Details Search In Restaurant"),
          FElevatedButton(context, () {Navigator.pushNamed(context, "/searchItems");}, "Search Items"),
          FElevatedButton(context, () {Navigator.pushNamed(context, "/locationChooseCity");}, "Location Choose City"),
          //FElevatedButton(context, () {Navigator.pushNamed(context, "/locationAddress");}, "Location Address"),
          FElevatedButton(context, () {Navigator.pushNamed(context, "/editAddress");}, "Edit Address 1"),
          FElevatedButton(context, () {Navigator.pushNamed(context, "/editAddress2");}, "Edit Address 2"),
          FElevatedButton(context, () {Navigator.pushNamed(context, "/detailsInfos");}, "Details Infos"),
          FElevatedButton(context, () {Navigator.pushNamed(context, "/detailsMyOrder");}, "Details My Order"),
          FElevatedButton(context, () {Navigator.pushNamed(context, "/detailsAddPromotionCode");}, "Details Add Promotion Code"),
          FElevatedButton(context, () {Navigator.pushNamed(context, "/search");}, "Search"),
          FElevatedButton(context, () {Navigator.pushNamed(context, "/driver");}, "Driver Side"),
        ]
      ),
    );
  }
}
