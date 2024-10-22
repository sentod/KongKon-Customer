import 'package:flutter/material.dart';

import 'scaffold.dart';
import '../component/slided_ad_cards.dart';
import '../component/slided_merchant_cards.dart';

Widget homeview(context, data){
  return 
  scaffold('home', data['maxWidth'], 

    Column(
      children: [

        // header
        Column(
          children: [

            // banner 
            Container(
              color: Theme.of(context).colorScheme.primary,
              child: SafeArea(child: 
             
            Image(
              image: const AssetImage('assets/Frame 87.png'),
              width: data['maxWidth'],
            ),)),

            // searchbar
            Transform.translate(
              offset: const Offset(0, -20),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(padding: const EdgeInsets.only(left: 15), child:  TextFormField(
                    onTap: (){},
                    decoration: const InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: 'Lagi butuh apa?',
                      border: InputBorder.none
                    ),  
                  ),)
                )
                
              )
            ),
          ],
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Expanded(
              child: TextButton(
                onPressed: (){}, 
                style: TextButton.styleFrom(
                  overlayColor: Colors.transparent
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 228, 233, 255),
                        shape: BoxShape.circle
                      ),
                      child: Image(
                        image: AssetImage('assets/food icon.png')),
                    ),
                    const SizedBox(height: 5,),
                    const Text('Food')
                  ],
                )
              )
            ),

            Expanded(
              child: TextButton(
                onPressed: (){}, 
                style: TextButton.styleFrom(
                  overlayColor: Colors.transparent
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/clean icon.png')
                        ),
                        color: Color.fromARGB(255, 228, 233, 255),
                        shape: BoxShape.circle
                      ),
                      child: Image(
                        image: AssetImage('assets/clean icon.png')),
                    ),
                    const SizedBox(height: 5,),
                    const Text('Clean')
                  ],
                )
              )
            )

          ],
        ),

        Padding(
          padding: EdgeInsets.only(top: 15, bottom: 5 , left: 15, right: 0),
          child: slided_ad_cards(context, data['maxWidth'], 'Si Paling Diskon')
        ),

        Padding(
          padding: EdgeInsets.only(top: 15, bottom: 5 , left: 15, right: 0),
          child: slided_merchant_cards(context, data['maxWidth'], 'Sedang Populer', data['merchant'])
        ),
        
        Padding(
          padding: EdgeInsets.only(top: 15, bottom: 5 , left: 15, right: 0),
          child: slided_merchant_cards(context, data['maxWidth'], 'Sedang Populer', data['merchant'])
        )
        
      ],
    )

  );
}