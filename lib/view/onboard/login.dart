import 'package:flutter/material.dart';

import 'loading.dart';

Widget loginview(maxwidth){
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(
            width: constraint.maxWidth,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masuk ke Akun Anda',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Masuk dan Temukan Kebutuhan Anda',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  )
              ],
            ),
          ),

          const SizedBox(height: 20),

          Image(
            image: const AssetImage('assets/Login 1.png'),
            width: constraint.maxWidth > 300 ? 230 : 300,
          ),

          SizedBox(
            width: constraint.maxWidth > maxwidth ? maxwidth : constraint.maxWidth,
            child: Column(
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Email'),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),  
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Password'),
                    const SizedBox(height: 5),
                    TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),  
                    ),
                  ],
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: (){}, 
                    child: Text(
                      'lupa password',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary
                      ),
                      )
                  )
                ),
              ]
            )
          ),
          
          const SizedBox(height:  20),

          Column(
            children: [

              ElevatedButton(
                onPressed: ()async{
                  showLoadingDialog(context);
                  await Future.delayed(const Duration(seconds: 1));
                  hideLoadingDialog(context);
                  Navigator.pushReplacementNamed(context, 'home');
                }, 
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

              SizedBox(height: constraint.maxHeight > 700 ? 30 : 0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum mempunyai akun?',
                    style: TextStyle(
                        fontSize: 10
                      ),
                    ),
                  TextButton(
                    onPressed: (){Navigator.pushNamed(context, 'signup');}, 
                    child: Text(
                      'Daftar disini',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 10
                        ),
                      )
                    ),
                ],
              )
            ],
          )
        ],
      ),
      
      ),

    )));
  }));
}