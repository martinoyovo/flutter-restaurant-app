import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/f_app_bar.dart';
import 'package:food_mobile/widgets/f_elevated_button.dart';

class LocationChooseCity extends StatefulWidget {
  LocationChooseCity({Key key}) : super(key: key);

  @override
  _LocationChooseCityState createState() => _LocationChooseCityState();
}

class _LocationChooseCityState extends State<LocationChooseCity> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = FClass().getFTheme(context);
    return Scaffold(
      appBar: FAppBar("Select Province/City", context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
                  color: Colors.grey.shade200,
                ),
                child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: getProportionateScreenWidth(13)),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search_rounded),
                        hintText: "Search",
                        hintStyle: theme.textTheme.bodyText1
                    )
                )
            ),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: getProportionateScreenWidth(10)),
                    physics: BouncingScrollPhysics(),
                    itemCount:  10,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(7)),
                        child: Column(
                          children: [
                            ListTile(
                              onTap:() => Navigator.pushNamed(context, "/locationAddress"),
                              title: Text("Edinburgh", style: theme.textTheme.bodyText1),
                              subtitle: Text("200 stores", style: theme.textTheme.subtitle1.copyWith(color: Colors.grey.shade700)),
                              trailing: (index % 2== 0) ?Icon(Icons.check_rounded, color: theme.primaryColor):SizedBox(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 0),
                            ),
                            Divider(
                              thickness: 0.5,
                            )
                          ],
                        )
                      );
                    }
                )
            ),
            FElevatedButton(context, () {
              Navigator.pushNamed(context, "/locationAddress");
            }, "Confirm"),
            SizedBox(
              height: getProportionateScreenWidth(10)
            )
          ],
        ),
      ),
    );
  }
}