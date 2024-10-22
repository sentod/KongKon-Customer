import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class MerchantNote extends StatelessWidget{
  final void Function(String note) setState;
  final double width ;
  final getNote = TextEditingController();

  MerchantNote({required this.width, required this.setState});



  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(width: width, height: 350, child: Column(
      children: [
        
        Padding(padding: EdgeInsets.only(top: 15, bottom: 15), child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              onPressed: (){Navigator.pop(context);}, 
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                overlayColor: Colors.transparent
              ),
              child: const Icon(
                Symbols.close,
              )
            ),
            Text(
              'Catatan untuk restoran',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        )),
        Container(
          width: width,
          height: 5,
          color: Color.fromRGBO(0, 0, 0, 0.05),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Optional'),
              const SizedBox(height: 10,),
              TextFormField(
                controller: getNote,
                maxLines: 3,
                maxLength: 255,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),  
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.all(15), child: TextButton(
          onPressed: (){
            setState(getNote.text);
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            fixedSize: Size(width, 50),
            backgroundColor: Theme.of(context).colorScheme.secondary
          ),
          child: Text(
            'Simpan',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white
            ),
          ),
        ))
        
      ], 
    ))
    ;
  }
}