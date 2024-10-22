import 'package:flutter/material.dart';

Widget signup_successview(maxwidth){
  return Center( 
      child:  LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint){
      return SizedBox(
      width: constraint.maxWidth > maxwidth ? maxwidth : constraint.maxWidth,
      child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: 
      Padding(padding: const EdgeInsets.all(30), child: 
  
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image(
            image: const AssetImage('assets/Sign Up 1.png'),
            width: constraint.maxWidth > 300 ? 230 : 300,
          ),

          SizedBox(
            width: constraint.maxWidth,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Berhasil \n Membuat Akun',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height:  10),
                Text(
                  'Hore! Akun sudah berhasil dibuat Silahkan melakukan Log In degan akun yang baru saja dibuat',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  )
              ],
            ),
          ),
          
          const SizedBox(height:  60),

          Column(
            children: [

              ElevatedButton(
                onPressed: (){Navigator.pop(context); Navigator.pushReplacementNamed(context, 'login');}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: constraint.maxWidth,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                        ),
                      ),
                    )
                ),
              ),
              
            ],
          )
        ],
      ),
      
      ),

    )));
  }));
}