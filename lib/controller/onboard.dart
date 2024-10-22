import 'package:flutter/material.dart';

import '../view/onboard/login.dart';
import '../view/onboard/signup.dart';
import '../view/onboard/signup_success.dart';

class Login extends StatefulWidget{
  @override
    _LoginState createState() =>_LoginState();
}

class _LoginState extends State<Login>  {

  double maxwidth = 500;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return loginview(maxwidth);
      
}}

class Signup extends StatefulWidget{
  @override
    _SignupState createState() =>_SignupState();
}

class _SignupState extends State<Signup>  {

  double maxwidth = 500;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return signupview(
      maxwidth,
      );
      
}}

class Signup_success extends StatelessWidget{
  final maxwidth = 500;
  @override
    Widget build(BuildContext context){
    return signup_successview(
      maxwidth,
      );
}}