import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:collection/collection.dart';

import '../view/dashboard/food/merchant.dart';
import '../view/dashboard/food/item.dart';

import '../model/merchant.dart';
import '../model/user.dart';

class BasketMerchant with ChangeNotifier {
  // List<dynamic> _basket = [];

  // List<dynamic> get basket => _basket;

  Future<void> updateBasket(List<dynamic> newBasket) async {
    final storage = Basket().storage;
    List basket = [newBasket];
    // print(newBasket);
    List userBasket = await loadBasket();
    if(userBasket == []){
      await storage.write(key: 'basket', value: jsonEncode(basket));
    }else{
      bool updated = false;
      List updatedBasket = userBasket;
      for(int i = 0; i < userBasket.length; i++){
        bool checkRadio = const DeepCollectionEquality().equals(userBasket[i][1], newBasket[1]);
        bool checkOptions = const DeepCollectionEquality().equals(userBasket[i][2], newBasket[2]);
        if(userBasket[i][0] == newBasket[0] && checkRadio && checkOptions){
          if (newBasket[4] == 0){
            updatedBasket.removeAt(i);
          }else{
            userBasket[i][4] = newBasket[4];
            userBasket[i][5] = newBasket[5];
          }
          updated = true;
        }
      }
      if(!updated)  userBasket.add(newBasket);
      await storage.write(key: 'basket', value: jsonEncode(userBasket));
    }
    notifyListeners();
  }

  Future<List<dynamic>> loadBasket() async {
    final storage = Basket().storage;
    String? getData = await storage.read(key: 'basket');
    if (getData != null) {
      final list = jsonDecode(getData);
      return list as List<dynamic>;
    } else {
      return [];
    }
  }

  Future<List<dynamic>> loadBasketItem(name) async {
    List result = [];
    final storage = Basket().storage;
    String? getData = await storage.read(key: 'basket');
    if (getData != null) {
      final getlist = jsonDecode(getData);
      final list = getlist as List<dynamic>;
      for(int i = 0; i< getlist.length; i++){
        if(list[i][0] == name){
          result.add(list[i]);
        }
      }
      return result;
    } else {
      return result;
    }
  }

  Future<int> itemAmount(String item) async{
    List basket = await loadBasket();
    int amount = 0;
    for(int i = 0; i < basket.length; i++){
      if(basket[i][0] == item){
        int itemAmount = basket[i][4];
        amount += itemAmount;
      }
    }
    return amount;
  }
}

class DetailMerchant with ChangeNotifier{
  Future<List> getDetailItem(String name) async{
    return getItemDetail(name);
  }
}

class Merchant {
  final double maxwidth = 500;

  Future<List> getBasket() async{
    final storage = Basket().storage;
    String? getData = await storage.read(key: 'basket');
    // print(await storage.read(key: 'basket'));
    if(getData != null){
      final list = jsonDecode(getData);
      return list as List<dynamic>;
    }else{
      return [];
    } 
  }

  Widget view(){
    final data = {
    'maxwidth': maxwidth,
    'merchant': getMerchantDetail(),
    'basket'  : getBasket()
    };
    return MerchantView(data: data);
  } 
}

class Item {
  final double maxwidth = 500;
  
  Future<void> updateBasket(value) async{
    final storage = Basket().storage;
    await storage.write(key: 'basket', value: jsonEncode(value));
  }

  Widget view(){
    
    // print(arguments);
    final data = {
    'maxwidth': maxwidth,
    // 'merchant': getItemDetail('aaa')
    };
    return ItemView(
      data: data,
      );
  } 

  
}




