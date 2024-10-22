import 'package:flutter/material.dart';
// import 'package:kongkon/model/merchant.dart';

Widget slided_merchant_cards(context, maxWidth, description, data){
  return FutureBuilder(
    future: data, 
    builder: (context, snapshot){
      if(snapshot.hasData){
        final data = snapshot.data as List;
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
                Padding(padding: const  EdgeInsets.only(right: 20), child:  TextButton(
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
              child: 
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                child: Row(
                  children: data.map((merchant){
                    return _card(
                      context,
                      merchant['image'],
                      merchant['name'],
                      merchant['kind'],
                      merchant['distance'],

                      );
                  }).toList(),
                ),
              )
            )
            
          ],
        );

      }else{
        return Text('data');
        
      }
    }
  );
}

Widget _card(context, image, name, kind, distance){
  return TextButton(
    onPressed: (){
      Navigator.pushNamed(context, 'merchant', arguments: name);}, 
      style: TextButton.styleFrom(
        overlayColor: Colors.transparent, 
        padding: const EdgeInsets.all(0)), 
        child: Padding(
          padding: const EdgeInsets.only(right: 10), 
          child: SizedBox(
            width: 128,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 128,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/$image'),
                      fit: BoxFit.cover
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5))
                  ),
                ),
                Text(
                  name,
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 12,
                    ),
                    const SizedBox(width: 6,),
                    const Text(
                      '4.3',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 11
                      ),
                    ),
                    const SizedBox(width: 6,),
                    Text(
                      kind,
                      style: const  TextStyle(
                        fontSize: 11
                      ),
                    )
                  ],
                ),
                Text(
                  'Rp 2.000  |  $distance KM',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 11
                  ),
                )
              ],
            ) 
          )
        )
  );
    
}