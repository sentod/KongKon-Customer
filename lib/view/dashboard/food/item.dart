import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:kongkon/controller/merchant.dart';

import '../../component/items_radio.dart';
import '../../component/items_select.dart';
import 'package:kongkon/view/component/merchant_note.dart';



class ItemView extends StatefulWidget {
  final dynamic data; 
  // static ItemView fromRoute(RouteSettings settings) {
  //   return ItemView(arguments: settings.arguments);
  // }

  // final Object? arguments;

  // final Future<void> Function(dynamic) updateBasket;

  ItemView({required this.data,});

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  // DetailMerchant? _merchant;
  List _radioOption = []; 
  List<List> _selectOption = [];
  String noteOption = '';
  int amount = 1;

  
  String itemName = '';
  int itemPrice = 0;
  int totalItemPrice = 0;

  List itemBasket = [];

  int _requiredOption = 0;

  @override
  void initState(){
    super.initState();
  }

  Future<void> initialze(arguments, basket) async{
   
    
    if(itemName == ''){
      List itemBasket = await basket;
      await getItem(arguments['name']);
      await getRadioLenght(arguments['name']);
      if(arguments['index'] >= 0){
        int index = arguments['index'];
        if(_requiredOption != 0)  updateRadioList(itemBasket[index][1]);
        if(itemBasket[index][2].length > 0)  updateSelectList(itemBasket[index][2]);
        updateNote(itemBasket[index][3]);
        setState(() {
          amount = itemBasket[index][4];
          totalItemPrice = itemBasket[index][5];
        });
      }
      updateItem(0);
    }
  }

  Future<void> getItem(name) async{
    DetailMerchant detailMerchant = DetailMerchant();
    final getList = await detailMerchant.getDetailItem(name);
    
    // final getList = list;
    int getPrice = int.parse(await getList[0]['price']);
    String getName = getList[0]['name'];
    // print(getPrice);
    setState(() {
      itemName = getName;
      itemPrice = getPrice;
      totalItemPrice = itemPrice;
    });
    
  }

  Future<void> getRadioLenght(name) async{
    DetailMerchant detailMerchant = DetailMerchant();
    final getList = await detailMerchant.getDetailItem(name);
    // final getList = list;
    final getRadio = getList[0]['optiongroup'] as List;
    for(int i = 0; i < getRadio.length; i++){
      if(getRadio[i]['type'] == 'radio'){
        _requiredOption = i+1;
      }
    }
  }

  Future<void> updateItem(price) async{
    setState(() {
      updatePrice(price);
      totalItemPrice = itemPrice*amount;
      itemBasket = [
        itemName,
        _radioOption,
        _selectOption,
        noteOption,
        amount,
        totalItemPrice
      ];
    });
  }

  Future<void> updatePrice(int price) async{
    setState(() {
      itemPrice += price;
    });
  }

  Future<void> updateRadioList(option) async{
    bool added = false;
    if(_radioOption == []){
      _radioOption.add(option);
      added = true;
    }else{
      for(int i=0; i < _radioOption.length; i++){
        if (_radioOption[i][0] == option[0]) {
          updateItem(-int.parse(_radioOption[i][1]['price']));
          _radioOption[i] = option;
          updateItem(int.parse(option[1]['price']));
          added = true;
        }
      }
      if(added == false){
        _radioOption.add(option);
        updateItem(int.parse(option[1]['price']));
      }
    }
    
  }

  Future<void> updateSelectList(option) async{
    bool changed = false;
    if(_selectOption.isEmpty){
      _selectOption.add(option);
      changed = true;
      updateItem(int.parse(option[1]['price']));
    }
    if(changed == false){
      for(int i=0; i < _selectOption.length; i++){
        if (_selectOption[i][1]['desc'] == option[1]['desc']) {
          updateItem(-int.parse(option[1]['price']));
          _selectOption.removeAt(i);
          changed = true;
        }
      }
      if(changed == false){
        _selectOption.add(option);
        updateItem(int.parse(option[1]['price']));
      }
    }
  }

  Future<void> updateNote(String getNote) async{
    setState(() {
      noteOption = getNote;
    });
    updateItem(0);
  }

  Future<void> updateAmount(bool add) async{
    int a = amount;
    if(add){
      a++;
    }else{
      if(a != 0){
        a--;
      }
    }
    setState(() {
      amount = a;
      totalItemPrice = itemPrice*a;
      updateItem(0);
    });
  }
    

  int getSelectedRadioIndex(name) {
    if (_radioOption.isNotEmpty) {
      int index = _radioOption.indexWhere((item) => item[0] == name);
      if(index == -1){
        return -1;
      }else {
        return _radioOption[index][2];
      }
    } else {
      return -1;
    }
  }


  @override
  Widget build(BuildContext context) {
    final basket = Provider.of<BasketMerchant>(context);
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // print(arguments['name']);
    initialze(arguments, basket.loadBasketItem(arguments['name']));
    return 
    
    Center( 
      child:  LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint){
      return SizedBox(
      width: constraint.maxWidth > widget.data['maxwidth'] ? widget.data['maxwidth'] : constraint.maxWidth,
      child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: 

        FutureBuilder(
          future: DetailMerchant().getDetailItem(arguments['name']), builder: (context, snapshot){
            
            // print('aa');
            if(snapshot.hasData){
            final merchant = snapshot.data as List;
            // getItem(merchant);
            // getRadioLenght(merchant);
            final group = merchant[0]['optiongroup'] as List;
            return

            SingleChildScrollView(child:

            // header
          Column(
            children: [

              // banner 
              Container(
                width: widget.data['maxwidth'],
                height: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/merchant/${merchant[0]['image']}'),
                    fit: BoxFit.cover
                    )
                ),
                child: SafeArea(child: 
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: TextButton(
                            onPressed: (){Navigator.pop(context);}, 
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              overlayColor: Colors.transparent
                            ),
                            child: const Icon(
                              Symbols.close,
                              // size: 40,   
                            )
                          ),
                        ),

                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: TextButton(
                            onPressed: (){}, 
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              overlayColor: Colors.transparent
                            ),
                            child: const Icon(
                              Symbols.share,
                              // size: 40,   
                            )
                          ),
                        ),
                        
                    ],
                  ),
                )
              )),

              Padding(
                padding: EdgeInsets.all(15),
                child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          merchant[0]['name'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0).format(int.parse(merchant[0]['price'])),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      merchant[0]['desc'],
                      style: TextStyle(
                        fontSize: 14,

                      ),
                    )
                  ],
                )
                
              ),

              Container(
                width: widget.data['maxwidth'],
                height: 10,
                color: Color.fromRGBO(0, 0, 0, 0.05),
              ),

              Column(
                children: group.map((items){
                  final option = items['option'] as List;
                  return Column(
                      children: [
                        
                        Padding(
                          padding: EdgeInsets.only(top: 10,  right: 15, left: 15),
                          child:  
                          items['type'] == 'radio'? 
                          RadioGroup(
                            name : items['name'],
                            options: option, 
                            selectedIndex: getSelectedRadioIndex(items['name']), 
                            onChanged:  (index) {
                              setState(() {
                                updateRadioList([items['name'], option[index], index]);
                              });
                            },
                          ): items['type'] == 'select'?
                          SelectGroup(
                            name : items['name'],
                            options: option, 
                            selectedIndex: _selectOption, 
                            onChanged:  (index) {
                              setState(() {
                                updateSelectList([items['name'], option[index]]);
                              });
                            },
                          )
                          : const Text('data') 
                        ),
                        Container(
                          width: widget.data['maxwidth'],
                          height: 10,
                          color: Color.fromRGBO(0, 0, 0, 0.05),
                        )
                      ],
                    );
                }).toList(),
              ),

              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [ 
                    TextButton(
                      onPressed: (){
                        showDialog(
                          context: context, 
                          barrierDismissible: true,
                          builder: (context){
                            return AlertDialog(
                              content: MerchantNote(
                                width: widget.data['maxwidth']-90,
                                setState: (getnote){
                                  updateNote(getnote);
                                },
                              ),
                              contentPadding: EdgeInsets.only(top: 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                            );
                          } 
                        );
                      }, 
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide()
                        )
                      ),
                      child:SizedBox(
                        width: widget.data['maxwidth'],
                        child:  Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Catatan untuk restoran',
                                  ),
                                  Text(
                                    ' (optional)',
                                    style: TextStyle(
                                      color: Colors.grey.shade500
                                      // fontSize: 10
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                noteOption,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300
                                ),
                                )
                            ],
                          ),
                        )
                      )
                    ),
                    const SizedBox(height: 30,),
                    Container(
                      width: 160,
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Theme.of(context).colorScheme.secondary
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                        children: [
                          TextButton(
                            onPressed: (){updateAmount(true);}, 
                            style: TextButton.styleFrom(
                              overlayColor: Colors.transparent
                            ),
                            child: Icon(
                              Symbols.add,
                              weight: 600,
                              color: Colors.white,
                              ),
                          ),
                          Text(
                            '$amount',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          TextButton(
                            onPressed: (){updateAmount(false);},
                            style: TextButton.styleFrom(
                              overlayColor: Colors.transparent
                            ),
                            child: Icon(
                              Symbols.remove,
                              weight: 600,
                              color: Colors.white,
                              ),
                          ),
                        ],
                      )
                    ),
                  ]
                )
              ),
              Container(
                width: widget.data['maxwidth'],
                height: 10,
                color: Color.fromRGBO(0, 0, 0, 0.05),
              )
              
              
            ],
          ));
            
            }
            else{
              return Text('loading');
            }
          }
      
      
      
      ),
      bottomNavigationBar:  Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        height: 85,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.10)),
          )
        ),
        child: TextButton(
          onPressed: _radioOption.length == _requiredOption? (){
            
            basket.updateBasket(itemBasket);
            Navigator.pop(context);
          } : null, 
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            disabledBackgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
            )
          ),
          child: Text(
            'Pesan - ${NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0).format(totalItemPrice)} ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white
            ),
          )
        ),
      ),
    ));
  }));
  }
}