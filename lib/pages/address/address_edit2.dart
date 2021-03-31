import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/f_app_bar.dart';
import 'package:food_mobile/widgets/f_elevated_button.dart';

class AddressEdit2 extends StatefulWidget {
  AddressEdit2({Key key}) : super(key: key);

  @override
  _AddressEdit2State createState() => _AddressEdit2State();
}

class _AddressEdit2State extends State<AddressEdit2> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    return Scaffold(
      appBar: FAppBar("Edit Contact", context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: getProportionateScreenWidth(25)),
        children: [
          Text("Contact Information", style: theme.textTheme.headline5.copyWith(color: Colors.grey.shade600),),
          Row(
            children: [
              Flexible(
                child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 0, top: getProportionateScreenWidth(13)),
                        prefixIcon: Icon(Icons.person),
                        hintText: "Michael",
                        hintStyle: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade600)
                    )
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(20),),
              Flexible(
                child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 0, top: getProportionateScreenWidth(13)),
                        prefixIcon: Icon(Icons.call_outlined),
                        hintText: "0355403403",
                        hintStyle: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade600)
                    )
                ),
              ),
            ],
          ),
          Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.home,),
                title: Text("123 Avenue Street", style: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade600)),
                trailing: Icon(CupertinoIcons.right_chevron, size: getProportionateScreenWidth(20),),
              ),
              Divider(thickness: 1.3, color: Colors.grey.shade400)
            ],
          ),
          TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 0, top: getProportionateScreenWidth(13)),
                  prefixIcon: Icon(Icons.list_alt),
                  hintText: "Note",
                  hintStyle: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade600)
              )
          ),
          SizedBox(height: getProportionateScreenWidth(30),),
          Text("Address Label (Optional)", style: theme.textTheme.headline5.copyWith(color: Colors.black),),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Checkbox(
                  value: true,
                  onChanged: (val) {
                    print(val);
                  },
                ),
                title: Text("Home", style: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade600)),
              ),
              ListTile(
                leading: Checkbox(
                  value: false,
                  onChanged: (val) {
                    print(val);
                  },
                ),
                title: Text("Work", style: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade600)),
              ),
              ListTile(
                leading: Checkbox(
                  value: false,
                  onChanged: (val) {
                    print(val);
                  },
                ),
                title: Row(
                  children: [
                    Flexible(
                      child: TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 0, top: getProportionateScreenWidth(13)),
                              hintText: "",
                              hintStyle: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade600)
                          )
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(size.width*0.15),)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenWidth(40),),
          Text("Deliver to", style: theme.textTheme.headline5.copyWith(color: Colors.black),),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Checkbox(
                  value: true,
                  onChanged: (val) {
                    print(val);
                  },
                ),
                title: Text("Deliver to door", style: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade600)),
              ),
              ListTile(
                leading: Checkbox(
                  value: false,
                  onChanged: (val) {
                    print(val);
                  },
                ),
                title: Text("Pickup outside", style: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade600)),
              ),
              SizedBox(height: getProportionateScreenWidth(30),),
              FElevatedButton(context, () {
                Navigator.pushNamed(context, "/locationAddress");
              }, "Confirm"),
            ],
          ),
        ],
      ),
    );
  }
}