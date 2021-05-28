import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/widgets/f_app_bar.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: FAppBar("Edit Information", context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        children: [
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  height: getProportionateScreenWidth(100),
                  width: getProportionateScreenWidth(100),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: blueColor
                      ),
                      child: Icon(Icons.add_a_photo_rounded, color: Colors.white, size: getProportionateScreenWidth(20),),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Username"),
              Spacer(),
              Flexible(
                child:  TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "helloimmike",
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Phone Number"),
              Spacer(),
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "0356634221",
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Address"),
              Spacer(),
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "189 Avenue Street",
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Email"),
              Spacer(),
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "minghanh31@gmail.com",
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}