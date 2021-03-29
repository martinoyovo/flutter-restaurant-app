import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/core/utils/f_input_decoration.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String usernameString = "Username";
  String emailString = "Emai";
  String passwordString = "Password";
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
                child: Text("Sign Up", style: theme.textTheme.headline6,)
            ),
            TextFormField(
                decoration: fInputDecoration(usernameString, theme)
            ),
            SizedBox(height: getProportionateScreenWidth(15),),
            TextFormField(
                decoration: fInputDecoration(emailString, theme)
            ),
            SizedBox(height: getProportionateScreenWidth(15),),
            TextFormField(
                decoration: fInputDecoration(passwordString, theme)
            ),
            SizedBox(height: getProportionateScreenWidth(30),),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Confirm"),
                style: ElevatedButton.styleFrom(
                    primary: theme.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(15))),
                    padding: EdgeInsets.symmetric(vertical: 11),
                    textStyle: theme.textTheme.headline5),
                onPressed: () {
                  Navigator.pushNamed(context, "/confirmPassword");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}