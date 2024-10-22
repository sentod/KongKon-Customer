import 'package:flutter/material.dart';

import '../view/dashboard/home.dart';
import '../model/merchant.dart';

class Home extends StatefulWidget{
  @override
    _HomeState createState() =>_HomeState();
}

class _HomeState extends State<Home>  {

  double maxwidth = 500;

  @override
  void initState(){
    super.initState();
    
  }

  @override
  Widget build(BuildContext context){
    final data = {
      'maxwidth' : maxwidth,
      'merchant' : getMerchant()
    };
    return homeview(context,data);
      
}}