import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/fake_datas/header_list.dart';
import 'package:restaurant_app/pages/restaurant_details.dart';
import 'package:restaurant_app/widgets/f_elevated_button.dart';
import 'package:restaurant_app/widgets/f_item_infos.dart';
import 'package:restaurant_app/widgets/f_loader.dart';
import 'package:restaurant_app/widgets/f_network_image.dart';
import 'package:restaurant_app/widgets/svg_image.dart';

class FCarousel extends StatefulWidget {
  @override
  _FCarouselState createState() => _FCarouselState();
}

class _FCarouselState extends State<FCarousel> {

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
    return _body(size.width, controller, theme);
  }
  _body(double height, PageController controller, ThemeData theme) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: height/1.50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: headerList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => RestaurantDetails(details: headerList[index]))
                  ),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
                        child: FNetworkImage(
                          height: height/1.50,
                          width: double.infinity,
                          radius: getProportionateScreenWidth(20),
                          imageUrl: headerList[index]["url"],
                        ),
                      ),
                      Container(
                        //margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
                          alignment: Alignment.bottomCenter,
                          child: ItemInfos(context: context, item: headerList[index])
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          _indicators(theme)
        ],
      ),
    );
  }

  _indicators(theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(headerList.length, (int index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: (index == currentPage) ? 10: 8,
          width: (index == currentPage) ? 10: 8,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: (index == currentPage) ? theme.primaryColor:Colors.grey.withOpacity(0.4)
          ),
        );
      }),
    );
  }
}
