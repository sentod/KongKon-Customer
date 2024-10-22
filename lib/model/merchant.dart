import 'dart:convert';



Future<List> getMerchant() async{
  var merchant = jsonEncode(
    {
      "data":[
        {"image":"image.png",
        "name":"Rawon Daging Pak Mul",
        "kind":"Soup",
        "distance":"0.7"},
        {"image":"image.png",
        "name":"Rawon Daging Pak Mul",
        "kind":"Soup",
        "distance":"0.7"},
        {"image":"image.png",
        "name":"Rawon Daging Pak Mul",
        "kind":"Soup",
        "distance":"0.7"},
      ]
    }
  );
  var decode = jsonDecode(merchant);
  return decode['data'] as List<dynamic>;
}

Future<List> getMerchantDetail() async{
  var merchant = jsonEncode(
    { "data":[
        {"image":"merchant/profile.png",
        "name":"Rawon Daging Pak Mul",
        "kind":"Soup",
        "distance":"0.7",
        "item":[
          {"group":"Menu Utama",
          "itemgroup":[
            {"id":"1",
            "name":"Rawon Daging",
            "desc":"Rawon daging ayam enak",
            "price":"35000",
            "image":"item 1.png"
            },
            {"id":"2",
            "name":"Rawon Daging Spesial",
            "desc":"Rawon daging ayam enak",
            "price":"45000",
            "image":"item 2.jpg"
            }
          ]},
          {"group":"Menu Sampingan",
          "itemgroup":[
            {"id":"3",
            "name":"Soto Daging",
            "desc":"Rawon daging ayam enak",
            "price":"35000",
            "image":"item 3.jpeg"
            },
          ]},
          {"group":"Minuman",
          "itemgroup":[
            {"id":"4",
            "name":"Teh",
            "desc":"Rawon daging ayam enak",
            "price":"3000",
            "image":"item 4.jpeg"
            },
          ]}
        ]}
      ]
    }
  );
  var decode = jsonDecode(merchant);
  return decode['data'] as List<dynamic>;
}

Future<List> getItemDetail(name) async{
  List result = [];
  var merchant = jsonEncode(
    { "data":[
        {"id":"1",
        "name":"Rawon Daging",
        "price":"35000",
        "image":"item 1.png",
        "desc":"Rawon daging ayam enak",
        "optiongroup":[
          {"type":"radio",
          "name":"Tingkat Pedas",
          "option":[
            {"desc":"Tidak Pedas",
            "price":"0"
            },
            {"desc":"Sedang",
            "price":"2000"
            },
            {"desc":"Pedas",
            "price":"5000"
            },
          ]
          },
          {"type":"radio",
          "name":"kuah",
          "option":[
            {"desc":"sedikit",
            "price":"0"
            },
            {"desc":"Sedang",
            "price":"0"
            },
            {"desc":"banyak",
            "price":"0"
            },
          ]
          },
          {"type":"select",
          "name":"Topping",
          "option":[
            {"desc":"Kerupuk",
            "price":"1000"
            },
            {"desc":"Toge",
            "price":"2000"
            },
            {"desc":"Extra Daging",
            "price":"5000"
            },
          ]
          }
        ]
        },
        {"id":"2",
        "name":"Rawon Daging Spesial",
        "price":"45000",
        "image":"item 2.jpg",
        "desc":"Rawon daging spesial sapi",
        "optiongroup":[
        ]
        },
      ]
    }
  );
  var decode = jsonDecode(merchant);
  List decodedList = decode['data'] as List;
  for(int i = 0; i< decodedList.length; i++){
    if(decodedList[i]['name'] == name){
      result = [decodedList[i]];
    }
  }
  
  return result;
}