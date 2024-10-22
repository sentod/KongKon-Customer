import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectGroup extends StatelessWidget {
  final String name;
  final List<dynamic> options;
  final List selectedIndex;
  final ValueChanged<int> onChanged;
  

  SelectGroup({
    required this.name,
    required this.options,
    required this.selectedIndex,
    required this.onChanged,
   
  });

  @override
  Widget build(BuildContext context) {
    List getSelectedItem = selectedIndex.map((list)=>list[1]['desc']).toList();
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
          'maximal ${options.length}',
          style: TextStyle(
            color: Colors.grey.shade500
          ),
        ),
        SizedBox(height: 10,),
        Column(
          children: options.map((option) {
            int index = options.indexOf(option);
            bool selected = false;
            if(selectedIndex.isNotEmpty){
              for(int i = 0; i < selectedIndex.length; i++){
                int a = getSelectedItem.indexWhere((item) => item == option['desc']);
                if(a != -1){
                  selected = true;
                }else {
                  selected = false;
                }
              }
            }
           
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
                        color: selected? Theme.of(context).colorScheme.secondary : Colors.transparent
                      )
                    )
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        option['desc'],
                        style: TextStyle(
                          color: selected? Theme.of(context).colorScheme.secondary : const Color.fromRGBO(0, 0, 0, 0.5),
                          fontWeight: selected? FontWeight.w600 : FontWeight.w400
                        ),
                      ),
                      option['price']!= '0'?
                      Text(
                        NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0).format(int.parse(option['price'])),
                        style: TextStyle(
                          color: selected? Theme.of(context).colorScheme.secondary : const Color.fromRGBO(0, 0, 0, 0.5),
                          fontWeight: selected? FontWeight.w600 : FontWeight.w400
                          )
                      ): const Text('') 
                    ],
                  )
                ),
                const SizedBox(height: 5,)
              ],
            );
            
          }).toList(),
        )
      ]
      
    );
  }
}
