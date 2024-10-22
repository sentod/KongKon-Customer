import 'package:flutter/material.dart';

Widget scaffold(active, maxwidth, child,){
  return Center( 
      child:  LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint){
      return SizedBox(
      // width: constraint.maxWidth > maxwidth ? maxwidth : constraint.maxWidth,
      width: 500,
      child: Scaffold(
      resizeToAvoidBottomInset: false,
      body:
      
      SingleChildScrollView(child: child,),
  
      bottomNavigationBar: Container(
        width: maxwidth,
        height: 60,
      
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.10)),
          
        )
      ),
      child: 
      // Padding(padding: const EdgeInsets.only(left: 0, right: 0), child:
      Row(
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
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.home,
                    color: active == 'home' ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: active == 'home' ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w100,
                      fontSize: 9
                    ),
                  )
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
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.attach_money,
                    color: active == 'payment' ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Payment',
                    style: TextStyle(
                      color: active == 'payment' ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w100,
                      fontSize: 9
                    ),                
                  )
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
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.insert_drive_file_outlined,
                    color: active == 'activity' ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Activity',
                    style: TextStyle(
                      color: active == 'activity' ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w100,
                      fontSize: 9
                    ),                
                  )
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
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.notifications_none,
                    color: active == 'notification' ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Notification',
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      overflow: TextOverflow.clip,
                      color: active == 'notification' ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w100,
                      fontSize: 9
                    ),                
                  )
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
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: active == 'account' ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      color: active == 'account' ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w100,
                      fontSize: 9
                    ),                
                  )
                ],
              )
            )
          ),
          
          
        ],
      ),
    // ),
    )));
  }));
}