import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RadioGroup extends StatelessWidget {
  final String name;
  final List<dynamic> options;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  

  RadioGroup({
    required this.name,
    required this.options,
    required this.selectedIndex,
    required this.onChanged,
   
  });



  @override
  Widget build(BuildContext context) {
    // print(selectedIndex);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$name :',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        ),
        Text(
          'pilih 1',
          style: TextStyle(
            color: Colors.grey.shade500
          ),
        ),
        SizedBox(height: 10,),
        Column(
          children: options.map((option) {
            int index = options.indexOf(option);
            return 
            
            Column(
              children: [
                TextButton(
                  onPressed: (){
                    onChanged(index);
                  }, 
                  style: TextButton.styleFrom(
                    overlayColor: Colors.transparent,
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    // backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: selectedIndex == index? Theme.of(context).colorScheme.secondary : Colors.transparent
                      )
                    )
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        option['desc'],
                        style: TextStyle(
                          color: selectedIndex == index? Theme.of(context).colorScheme.secondary : const Color.fromRGBO(0, 0, 0, 0.5),
                          fontWeight: selectedIndex == index? FontWeight.w600 : FontWeight.w400
                        ),
                      ),
                      option['price']!= '0'?
                      Text(
                        NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0).format(int.parse(option['price'])),
                        style: TextStyle(
                          color: selectedIndex == index? Theme.of(context).colorScheme.secondary : const Color.fromRGBO(0, 0, 0, 0.5),
                          fontWeight: selectedIndex == index? FontWeight.w600 : FontWeight.w400
                          )
                      ): const Text('') 
                    ],
                  )
                ),
                SizedBox(height: 5,)
              ],
            );
            
          }).toList(),
        ),
      ]
      
    );
  }
}
