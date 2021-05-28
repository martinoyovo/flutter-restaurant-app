import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class FPageContainer extends StatelessWidget {
  final Widget insideWidget;

  const FPageContainer({Key key, this.insideWidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: size.height*0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(getProportionateScreenWidth(40)),
                    bottomRight: Radius.circular(getProportionateScreenWidth(40)),
                  )
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: getProportionateScreenWidth(40), bottom: getProportionateScreenWidth(15)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Delivery address", style: GoogleFonts.openSans(fontSize: getProportionateScreenWidth(14), color: Colors.white),),
                              Row(
                                children: [
                                  Text("Address", style: GoogleFonts.openSans(fontSize: getProportionateScreenWidth(14), color: Colors.white),),
                                  Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
                                ],
                              )
                            ]
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: getProportionateScreenWidth(10)),
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(context, "/locationChooseCity"),
                            child: Row(
                              children: [
                                Icon(Icons.location_on_outlined, color: Colors.white),
                                SizedBox(width: getProportionateScreenWidth(12)),
                                Text("Avenue street", style: theme.textTheme.bodyText2.copyWith(color: Colors.white),),
                                SizedBox(width: getProportionateScreenWidth(17)),
                                Icon(Icons.edit_outlined, color: Colors.white),
                              ],
                            ),
                          )
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
                            color: Colors.white,
                          ),
                          child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(getProportionateScreenWidth(10)),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search_rounded),
                                  hintText: "Search",
                                  hintStyle: theme.textTheme.bodyText1
                              )
                          )
                      ),
                    ]
                ),
              )
          ),
          this.insideWidget
        ],
      ),
    );
  }
}
