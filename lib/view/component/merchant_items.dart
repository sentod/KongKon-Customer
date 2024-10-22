import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:kongkon/controller/merchant.dart';


Widget merchant_items(context, maxwidth, items){
  final itemgroup = items['itemgroup'] as List;
  final basket = Provider.of<BasketMerchant>(context);
  // print(items);
  // print(itemgroup);
  return Container(
      width: maxwidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            items['group'],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
          ),
          

          Column(
            children: itemgroup.map((item){
              return _Card(
                // context,
                maxwidth: maxwidth,
                itemId:  item['id'],
                itemName:  item['name'],
                itemDesc:   item['desc'],
                itemPrice:  item['price'],
                itemImage:  item['image'],
                amount:  basket.itemAmount(item['name'])
                );
            }).toList(),
          )

          
        ],
      )
    );
}

class _Card extends StatefulWidget {
  final dynamic maxwidth;
  final dynamic itemId;
  final dynamic itemName;
  final dynamic itemDesc;
  final dynamic itemPrice;
  final dynamic itemImage;
  final dynamic amount;

  _Card({this.maxwidth, this.itemId, this.itemName, this.itemDesc,this.itemPrice, this.itemImage, this.amount});
  @override
  State<_Card> createState() => _CardState();
}

class _CardState extends State<_Card> with TickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  

  Future<void> itemPopup(itemname,itemprice, maxwidth, variant) async{
    List itemVariant = await variant as List;
    // print(await widget.amount);
    // if(itemVariant.isNotEmpty){
    //   // List radio = itemVariant[1] as List;
    //   // List select = itemVariant[2] as List;
    //   // print(await widget.amount);
      
    //   // print(select);
    // }
    
    if(await widget.amount != 0 && itemVariant[0]['optiongroup'].length != 0){
      showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 300),
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return _ItemPopUp(
            itemName: itemname,
            itemPrice: itemprice,
            maxwidth: maxwidth,
          );
        },
        transitionBuilder: (context, anim1, anim2, child) {
          return SlideTransition(
            position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
            child: child,
          );
        },
      );
    }else if(itemVariant[0]['optiongroup'].length == 0 && await widget.amount != 0){
      Navigator.pushNamed(context, 'item', arguments: {
        'name' : widget.itemName,
        'index' : 0
        });
    }
    else{
      Navigator.pushNamed(context, 'item', arguments: {
        'name' : widget.itemName,
        'index' : -1
        });
    }
  }

  
  
  @override
  Widget build(BuildContext context){
  final item = Provider.of<DetailMerchant>(context);
  final itemVariant = item.getDetailItem(widget.itemName);
  return Column (children: [
    Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        width: widget.maxwidth,
        height: 1,
        color: Color.fromRGBO(0, 0, 0, 0.1),
      ),
    ),
    
    TextButton(onPressed: (){
      Navigator.pushNamed(context, 'item', arguments: {'name':widget.itemName, 'index':-1});}, style: TextButton.styleFrom(padding: EdgeInsets.zero, overlayColor: Colors.transparent), child: IntrinsicHeight(child:  Container(
      width: widget.maxwidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                widget.itemName,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 15,),
              Text(
                widget.itemDesc,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200
                ),
              ),
              const SizedBox(height: 15,),
              Text(
                NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0).format(int.parse(widget.itemPrice)),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),

          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/merchant/${widget.itemImage}'),
                    fit: BoxFit.cover,
                    ),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: 140,
                height: 105,
              ),
              Transform.translate(
                offset: Offset(0, -15),
                child: TextButton(
                  onPressed: ()async{
                    await itemPopup(
                      widget.itemName,
                      widget.itemPrice,
                      widget.maxwidth,
                      itemVariant
                    );
                  }, 
                  style: TextButton.styleFrom(
                    overlayColor: Colors.transparent,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  child: FutureBuilder(future: widget.amount, builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Text('');
                    }
                    else if(snapshot.hasData && snapshot.data != 0){
                      return Text(
                          '${snapshot.data} pesanan',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        );
                      }else{
                        return Text(
                          'Buat Pesanan',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        );
                    }
                  }) 
                )
              )
      
            ],
          )
          
        ],
      ),
    )))
  ],) ;
  
}}

class _ItemPopUp extends StatefulWidget {
  final double maxwidth;
  final String itemName;
  final String itemPrice;

  _ItemPopUp({required this.maxwidth, required this.itemName, required this.itemPrice});

  @override
  State<_ItemPopUp> createState() => _ItemPopUpState();
}

class _ItemPopUpState extends State<_ItemPopUp> {
  Future<void> checkBasket(basket) async{
    List loadBasket = await basket as List;
    if(loadBasket.length == 0){
      Navigator.pop(context);
    } 
  }
  @override
  Widget build(BuildContext context){
    final basket = Provider.of<BasketMerchant>(context);
    final loadBasket = basket.loadBasketItem(widget.itemName);
    checkBasket(loadBasket);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 300,
        width: widget.maxwidth,
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(
                    widget.itemName,
                    // overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20, 
                      fontWeight: FontWeight.w600)
                  )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0).format(int.parse(widget.itemPrice)),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Text(
                        'harga dasar',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: widget.maxwidth,
              height: 10,
              color: Color.fromRGBO(0, 0, 0, 0.05),
            ),
            Expanded(child: SingleChildScrollView(
              child: FutureBuilder(
                future: basket.loadBasketItem(widget.itemName),
                builder:(context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Text('');
                  }
                  else if(snapshot.hasData){
                    List itemVariant = snapshot.data as List;
                    return Column(
                      children: itemVariant.map((item){
                        List radio = item[1] as List;
                        List select = item[2] as List;
                        return TextButton(
                          onPressed: () async{
                            print('object');
                          }, 
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0), 
                              overlayColor: Colors.transparent
                          ),
                          child: SizedBox(
                            width: widget.maxwidth,
                            child: Column(
                              children: [ 
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(child: Column(
                                      children: (radio+select).map((option){
                                        bool sameOption = false;
                                        int index = (radio+select).indexOf(option);
                                        if (index != 0) sameOption = (radio+select)[index-1][0] == option[0];
                                        return Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            SizedBox(width: 120, child: Text(
                                              sameOption? '' : '${option[0]} :',
                                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                                fontSize: 12,
                                              ),
                                            )),
                                            Expanded(child: Text(
                                              option[1]['desc'],
                                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600
                                              ),
                                            )),
                                          ],
                                        );
                                      }).toList(),
                                    )),
                                    SizedBox(width: 20,),
                                    Text(
                                      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0).format(item[5]),
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  ]
                                ),
                                const SizedBox(height: 15,),
                                item[3] != ''?  Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    SizedBox(width: 120, child: Text(
                                      'Catatan :',
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        fontSize: 12,
                                      ),
                                    )),
                                    Expanded(child: Text(
                                      item[3],
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )),
                                  ],
                                ) : const SizedBox(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'ubah pesanan',
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.w600,
                                        color: Theme.of(context).colorScheme.secondary
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Container(
                                      // width: 100,
                                      height: 25,
                                      // padding: EdgeInsets.only(top: 5, bottom: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                        color: Theme.of(context).colorScheme.secondary
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                                        children: [
                                          TextButton(
                                            onPressed: (){
                                              int updatedPrice = item[5] + (item[5]/item[4]);
                                              item[4]++;
                                              item[5] = updatedPrice;
                                              basket.updateBasket(item);
                                            }, 
                                            style: TextButton.styleFrom(
                                              overlayColor: Colors.transparent
                                            ),
                                            child: Icon(
                                              Symbols.add,
                                              weight: 600,
                                              color: Colors.white,
                                              size: 14,
                                              ),
                                          ),
                                          Text(
                                            item[4].toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: (){
                                              int updatedPrice = item[5] - (item[5]/item[4]);
                                              item[4]--;
                                              item[5] = updatedPrice;
                                              basket.updateBasket(item);
                                            },
                                            style: TextButton.styleFrom(
                                              overlayColor: Colors.transparent
                                            ),
                                            child: Icon(
                                              Symbols.remove,
                                              weight: 600,
                                              color: Colors.white,
                                              size: 14,
                                              ),
                                          ),
                                        ],
                                      )
                                    ),
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(top: 15), child:  Container(
                                  width: widget.maxwidth,
                                  height: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                )),
                              ]
                            )
                          )
                        );
                      }).toList()
                    );
                  }
                  else{
                    return  Text('');
                  }
                }
              )
            ))
            
          ],
        ),
      ),
    );
  }
}