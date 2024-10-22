import 'package:flutter/material.dart';

Widget slided_ad_cards(context, maxWidth, description){
  return
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            description,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 20), child:  TextButton(
            onPressed: (){}, 
            child: Text(
              'Lihat semua',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary
              ),
            ),
          )),
        ],
      ),

      const SizedBox(height: 10,),
      
      SizedBox(
        width: maxWidth,
        height: 246,
        child: 
         SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          // shrinkWrap: true,
          child: Row(
            children: [
            _card('KongKon Food','Gratis ongkir selama Grand Opening' , 'ad 3.jpg'),
            _card('KongKon Clean', 'Diskon sampai dengan 75%', 'ad 4.jpg'),
            ],
          ),
        )
      )
      
    ],
  );
}

Widget _card(service, desc, image){
  return Padding(padding: const EdgeInsets.only(right: 10), child: Container(
    width: 138,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/$image'),
        fit: BoxFit.cover
      ),
      borderRadius: BorderRadius.all(Radius.circular(20))
    ),
    child: Padding(padding: const EdgeInsets.all(10),child:  Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          desc,
          maxLines: 2,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
            color: Colors.white
          ),
        ),
        Text(
          service,
          style: TextStyle(
            shadows: [
              Shadow(
                offset: Offset(0, 0),
                color: Colors.black,
                blurRadius: 10.0,
              ),
            ],
            fontSize: 10,
            fontWeight: FontWeight.w100,
            color: Colors.white
          ),
        )
      ],
    )),
  ));
}