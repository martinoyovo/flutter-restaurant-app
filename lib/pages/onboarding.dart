import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/f_elevated_button.dart';
import 'package:food_mobile/widgets/svg_image.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<Map<String, String>> list = [
    {
      "image": "assets/imgs/onboarding_1.svg",
      "titre": "Deliver Food to you door",
      "soutitre": "Find the right restaurant for you",
    },
    {
      "image": "assets/imgs/onboarding_2.svg",
      "titre": "Find all restaurant in one app",
      "soutitre": "Choose your favourite restaurant",
    },
  ];
  var controller = PageController();
  var currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page.round();
      });
    });
    SizeConfig().init(context);
    return SafeArea(
      child: WillPopScope(
        onWillPop: () => exit(0),
        child: Scaffold(
          backgroundColor: Colors.white,
          body:  Column(
            children: [
              _body(size.width, controller, theme),
              _authButtons(theme),
            ],
          ),
        ),
      ),
    );
  }
  _body(double size, PageController controller, ThemeData theme) {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: getProportionateScreenWidth(15), top: getProportionateScreenWidth(40)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent,
                ),
                height: size*0.7,
                width: size*0.9,
                child: SvgImage(list[index]['image'].toString())
              ),
              _indicators(theme),
              Container(
                margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(60), vertical: getProportionateScreenWidth(10)),
                child: Text(
                  list[index]["titre"],
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headline6
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(13)),
                child: Text(
                  list[index]["soutitre"],
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyText1
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _indicators(theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(list.length, (int index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: (index == currentPage) ? 10: 8,
          width: (index == currentPage) ? 10: 8,
          margin: EdgeInsets.symmetric(vertical: 13, horizontal: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: (index == currentPage) ? theme.primaryColor:Colors.grey.withOpacity(0.4)
          ),
        );
      }),
    );
  }
  _authButtons(theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: FElevatedButton(
              context,
                  () {
                Navigator.pushNamed(context, '/signIn');
                },
              "Sign in",
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          margin: EdgeInsets.only(top: getProportionateScreenWidth(5), bottom: getProportionateScreenWidth(10)),
          child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signIn');
            },
            textColor: theme.primaryColor,
            padding: EdgeInsets.symmetric(vertical: 11),
            child: Text("Skip", style: theme.textTheme.headline4),
            highlightColor: theme.primaryColor.withOpacity(0.2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(15))),
          ),
        )
      ]
    );
  }
}
