import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/core/utils/f_input_decoration.dart';
import 'package:restaurant_app/widgets/svg_image.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String usernameString = "Username";
  String passwordString = "Password";
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: getProportionateScreenWidth(30), top: size.height*0.11),
                  child: Text("Sign In", style: theme.textTheme.headline6,)
              ),
              TextField(
                decoration: fInputDecoration(usernameString, theme, null)
              ),
              SizedBox(height: getProportionateScreenWidth(15),),
              TextField(
                decoration: fInputDecoration(passwordString, theme, null)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text("Forgot password?", style: theme.textTheme.bodyText1,),
                    onTap: () => Navigator.pushNamed(context, "/confirmPassword"),
                  ),
                ],
              ),
              SigninButtons(theme),
              SizedBox(height: getProportionateScreenWidth(20),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't you have an account?", style: theme.textTheme.subtitle1,),
                  InkWell(
                    child: Text(" Sign up now!", style: theme.textTheme.subtitle1.copyWith(color: primaryColor),),
                    onTap: () {
                      Navigator.pushNamed(context, '/signUp');
                    },
                  ),
                ],
              ),
          ],
      ),
        ),
      ),
    );
  }

  Widget SigninButtons(theme) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: getProportionateScreenWidth(20),),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              child: Text("Sign in"),
              style: ElevatedButton.styleFrom(
                  primary: theme.primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(15))),
                  padding: EdgeInsets.symmetric(vertical: 11),
                  textStyle: theme.textTheme.headline5),
              onPressed: () => Navigator.pushNamed(context, "/nav"),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
            child: Text("OR", style: theme.textTheme.headline3),
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton.icon(
              label: Text("Sign in with Facebook"),
              style: ElevatedButton.styleFrom(
                  primary: blueColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(15))),
                  padding: EdgeInsets.symmetric(vertical: 11),
                  textStyle: theme.textTheme.headline5),
              onPressed: () {},
              icon: Container(
                height: getProportionateScreenWidth(20),
                width: getProportionateScreenWidth(20),
                margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
                child: SvgImage("assets/icons/facebook.svg")
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(10),),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: getProportionateScreenWidth(5), bottom: getProportionateScreenWidth(10)),
            child: OutlinedButton.icon(
              onPressed: () {},
              label: Text("Sign in with Google", style: theme.textTheme.headline5),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                  primary: blueColor,
                  elevation: 0,
                  side: BorderSide(color: Colors.grey, width: 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(15))),
                  padding: EdgeInsets.symmetric(vertical: 11),
                  textStyle: theme.textTheme.headline5),
              icon: Container(
                height: getProportionateScreenWidth(20),
                width: getProportionateScreenWidth(20),
                  margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/google.png')
                  )
                )
              ),
            ),
          )
        ]
    );
  }
}