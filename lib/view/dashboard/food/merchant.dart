import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:kongkon/controller/merchant.dart';
import '../../component/merchant_items.dart';


class MerchantView extends StatefulWidget {
  final dynamic data; 
  

  MerchantView({required this.data});

  @override
  _MerchantViewState createState() => _MerchantViewState();
}

class _MerchantViewState extends State<MerchantView>{
 @override
 Widget build(BuildContext context){
  final basket = Provider.of<BasketMerchant>(context);
  return Center( 
      child:  LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint){
      return SizedBox(
      width: constraint.maxWidth > widget.data['maxwidth'] ? widget.data['maxwidth'] : constraint.maxWidth,
      child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(future: widget.data['merchant'], builder: (context, snapshot){
      if(snapshot.hasData){
      final merchant = snapshot.data as List;
      final group = merchant[0]['item'] as List;
      return

      SingleChildScrollView(child:
  
      Column(
        children: [

          // header
          Column(
            children: [

              // banner 
              Container(
                width: widget.data['maxwidth'],
                height: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/${merchant[0]['image']}'),
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
                     
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: TextButton(
                            onPressed: (){Navigator.pop(context);}, 
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              overlayColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              )
                            ),
                            child: const Icon(
                              Symbols.keyboard_arrow_left,
                              size: 40,   
                            )
                          ),
                        ),
                        

                        Row(
                          children: [

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
                                  Symbols.search,
                                  // size: 40,   
                                )
                              ),
                            ),

                            const SizedBox(width: 10,),

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
                                  Symbols.favorite,
                                  // size: 40,   
                                )
                              ),
                            ),

                            const SizedBox(width: 10,),

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
                        )
                      
                      
                    ],
                  ),
                )
              )),

              // card merchant
              Transform.translate(
                offset: const Offset(0, -20),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    width: widget.data['maxwidth'],
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 0.25)
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15), 
                      child: Column(
                        children: [
                          Text(
                            merchant[0]['name'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            width: widget.data['maxwidth'],
                            height: 1,
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, right: 15, left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    SizedBox(width: 6,),
                                    Text(
                                      '4.3',
                                      style: TextStyle(
                                        fontSize: 15
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Icon(
                                      Symbols.location_pin,
                                      size: 20,
                                    ),
                                    SizedBox(width: 6,),
                                    Text(
                                      merchant[0]['distance'],
                                      style: TextStyle(
                                        fontSize: 15
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Icon(
                                      Symbols.timer,
                                      size: 20,
                                    ),
                                    SizedBox(width: 6,),
                                    Text(
                                      '4-6 min',
                                      style: TextStyle(
                                        fontSize: 15
                                      ),
                                    ),
                                  ],
                                ),
                                
                              ],
                            ),
                          )
                          
                        ],
                      )  
                    )
                  )
                  
                )
              ),
            ],
          ),

          Column(
            children: group.map((items){
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
                  child:  
                  merchant_items(
                    context,
                    widget.data['maxwidth'], 
                    items,
                    )
                ),
                Container(
                  width: widget.data['maxwidth'],
                  height: 10,
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                )
              ],
            );
            
            }).toList(),
          )
          
        ],
           
      ));
      }else{
        return Text('loading');
      }
      }),
      bottomNavigationBar: FutureBuilder(
        future: basket.loadBasket(), 
        builder: (context, snapshot){
          // print(snapshot.data);
          if(snapshot.hasData && (snapshot.data as List).isNotEmpty){
            final basket = snapshot.data as List;
            
            int amountTotal = 0;
            int priceTotal = 0;
            for(int i = 0; i < basket.length; i++){
              int itemAmount = basket[i][4];
              int itemPrice = basket[i][5];
              amountTotal += itemAmount;
              priceTotal += itemPrice;
            }
            if(basket.length == 0){
              return Text('');
            }else{
              return  Container(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                height: 85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.10)),
                  )
                ),
                child: TextButton(
                  onPressed: (){}, 
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    disabledBackgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                  ),
                  child: Text(
                    '$amountTotal Pesanan - ${NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0).format(priceTotal)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  )
                ),
              );
            }
          }else{
            return Text('');
          }
        }),
      ));
  }));
 }
}



// Widget merchantview(context, data){
  
// }