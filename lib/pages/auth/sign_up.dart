import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/core/utils/f_input_decoration.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String usernameString = "Username";
  String emailString = "Email";
  String passwordString = "Password";
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp _emailValidator = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  bool isFieldObscured = false;
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
        child: Form(
          key: _formKey,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: getProportionateScreenWidth(30)),
                  child: Text("Sign Up", style: theme.textTheme.headline6,)
              ),
              TextFormField(
                controller: _usernameController,
                  decoration: fInputDecoration(usernameString, theme, Container()),
                validator: (value) {
                  if (value.length<= 3) {
                    return "Username must at least contain 3 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: getProportionateScreenWidth(15),),
              TextFormField(
                controller: _emailController,
                  decoration: fInputDecoration(emailString, theme, Container()),
                validator: (value) {
                  if (!_emailValidator.hasMatch(value)) {
                    return 'Email is invalid';
                  }
                  return null;
                },
              ),
              SizedBox(height: getProportionateScreenWidth(15),),
              TextFormField(
                controller: _passwordController,
                  decoration: fInputDecoration(passwordString, theme, Container()),
                validator: (value) {
                  if (value.length<= 3) {
                    return "Password must at least contain 3 characters";
                  }
                  return null;
                },
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
                    if(_formKey.currentState.validate()){
                      Navigator.pushNamed(context, "/nav");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}