import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/f_input_decoration.dart';
import 'package:food_mobile/core/utils/size_config.dart';

class ConfirmPassword extends StatefulWidget {
  @override
  _ConfirmPasswordState createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  String emailString = "Email";
  String confirmationString = "Please enter your email address. You will receive a link to create a new password via email";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.only(bottom: getProportionateScreenWidth(30)),
                child: Text("Forgot Password", style: theme.textTheme.headline6,)
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15), horizontal: getProportionateScreenWidth(25)),
              child: Text(confirmationString,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyText1
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(10),),
            TextFormField(
                decoration: fInputDecoration(emailString, theme)
            ),
            SizedBox(height: getProportionateScreenWidth(15),),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Send"),
                style: ElevatedButton.styleFrom(
                    primary: theme.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(15))),
                    padding: EdgeInsets.symmetric(vertical: 11),
                    textStyle: theme.textTheme.headline5),
                onPressed: () {
                  Navigator.pop(context, "/confirmPassword");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
